using API.Code;
using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using API.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Common;
using Token = API.Services.Token;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IUser _user;
        private readonly IRole _role;
        private readonly EmailService _email;
        private readonly Password _password;
        private Token _token;

        public AccountController(IUser user, IRole role, Token token, EmailService email, Password password)
        {
            _user = user;
            _token = token;
            _role = role;
            _email = email;
            _password = password;   
        }
        [HttpGet("testserver")]
        public async Task<ActionResult<IEnumerable<Role>>> TestCall()
        {
            return Ok();
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Role>>> GetUsers()
        {
            var usrs = _user.GetAll();
            return Ok(usrs);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterDTO registerDTO)
        {
            try
            {
                var email = registerDTO.Email;
                if (_user.GetByEmail(email).GetAwaiter().GetResult() != null)
                {
                    return BadRequest("Email already Registered");
                }
                var passwdObj = _password.PasswordHash(registerDTO.Password);
                var newUsr = new User()
                {
                    FirstName = registerDTO.firstName,
                    LastName = registerDTO.lastName,
                    Email = registerDTO.Email,
                    PhoneNo = registerDTO.PhoneNo,
                    Dob = registerDTO.DOB,
                    CreateDate = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    RoleId = registerDTO.RoleID,
                    PasswordHash = passwdObj[0],
                    PasswordSalt = passwdObj[1]
                };

                var u = await _user.CreateAsync(newUsr);
                _email.sendWelcomeEmail(newUsr);
                var resp = new
                {
                    Message = "User Registratered Successfully",
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpPost("login")]
        public Task<IActionResult> Login(LoginDTO loginDTO)
        {
            try
            {
                var email = loginDTO.Email;
                var user = _user.GetByEmail(email).GetAwaiter().GetResult();
                if (user == null)
                {
                    var res = new
                    {
                        Message= "Invalid Email ID"
                    };
                    return Task.FromResult<IActionResult>(BadRequest(res));
                }
                bool validPasswd = _password.CheckPassword(loginDTO.Password, user.PasswordSalt, user.PasswordHash);
                if (!validPasswd)
                {
                    var res = new
                    {
                        Message = "Invalid Password"
                    };
                    return Task.FromResult<IActionResult>(BadRequest(res));
                }
                int roleID = (int)user.RoleId;
                var role = _role.GetByID(roleID).GetAwaiter().GetResult();
                var TokenDTO = new TokenClaimDTO()
                {
                    UserId=user.UserId,
                    Name = user.FirstName + " " + user.LastName,
                    Email = user.Email,
                    Role = role.Role1
                };
                var token = _token.CreateToken(TokenDTO, 15, 0, true);
                var resp = new
                {
                    Message="Login Successfull",
                    token,
                };
                
                return Task.FromResult<IActionResult>(Ok(resp));
            }
            catch(Exception ex) 
            {
                return Task.FromResult<IActionResult>(BadRequest(ex.Message));
            }
        }

        [HttpPost("forgotpassword")]
        public async Task<IActionResult> SendOTP(EmailDTO emailDTO)
        {
            try
            {
                var user =await _user.GetByEmail(emailDTO.Email);
                if (user == null)
                {
                    var notFoundResp = new
                    {
                        message = "User not Found"
                    };
                    return(BadRequest(notFoundResp));
                }
                var otpStr=await _email.SendResetPasswordOTP(user);
                user.LastOtp = otpStr;
                Console.WriteLine(otpStr);
                user.UpdateDate = DateTime.Now;
                await _user.UpdateAsync(user, user.UserId);
                //Console.WriteLine(user);
                var resp = new
                {
                    message = $"OTP sent to the Email - {user.Email}. OTP is valid for 5 Minutes."
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("resetpassword")]
        public async Task<IActionResult> ResetPassword(PasswordResetDTO passwordResetDTO)
        {
            try
            {
                var user = await _user.GetByEmail(passwordResetDTO.Email);
                if (user == null)
                {
                    var notFoundResp = new
                    {
                        message = "Something went Wrong !"
                    };
                    return (BadRequest(notFoundResp));
                }
                var dbOtpStr = user.LastOtp;
                TimeSpan d = (TimeSpan)(user.UpdateDate - DateTime.Now);
                var m = d.TotalMinutes;
                if (m>5)
                {
                    var notFoundResp = new
                    {
                        message = "OTP Expired !"
                    };
                    return (BadRequest(notFoundResp));
                }

                if (passwordResetDTO.OTP != dbOtpStr)
                {
                    var notFoundResp = new
                    {
                        message = "Wrong OTP !"
                    };
                    return (BadRequest(notFoundResp));
                }

                var pwdData = _password.PasswordHash(passwordResetDTO.NewPassword);

                user.PasswordHash = pwdData[0];
                user.PasswordSalt = pwdData[1];
                user.UpdateDate = DateTime.Now;

                await _user.UpdateAsync(user, user.UserId);

                var resp = new
                {
                    message = "Password Changed Successfully"
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



    }
}
