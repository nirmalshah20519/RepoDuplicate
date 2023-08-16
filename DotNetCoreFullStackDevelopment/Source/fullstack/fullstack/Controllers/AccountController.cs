using fullstack.Code;
using fullstack.Code.Interface;
using fullstack.DTOs;
using fullstack.Models;
using fullstack.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace fullstack.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IUser _user;
        private readonly Password _password;
        private readonly Email _email;
        private readonly S3Upload _s3Upload;
        private readonly IPayment _payment;
        private readonly FullStackExamContext _context;

        public AccountController(IPayment payment, IUser user, Password password, Email email, S3Upload s3Upload, FullStackExamContext context)
        {
            _user=user;
            _password = password;
            _email=email;
            _s3Upload = s3Upload;
            _payment = payment;
            _context = context;
        }


        [HttpGet]
        public async Task<IActionResult> getAll()
        {
            return Ok(await _user.GetAll());
        }
        [HttpPost("upload")]
        public async Task<IActionResult> upload(IFormFile file)
        {
            try
            {
                var profileURL = await _s3Upload.UploadImage(file);
                var resp = new
                {
                    url = profileURL,
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost("login")]
        public async Task<IActionResult> login(LoginDTO loginDTO)
        {
            try
            {
  
                var users = await _user.GetAll();
                var user=users.FirstOrDefault(x=>x.UserId==loginDTO.userID);
                if (user==null)
                {
                    var NotFoundresp = new
                    {
                        Message = "User Not Found"
                    };
                    return NotFound(NotFoundresp);
                }
                var isValid = _password.Verify(loginDTO.password, user.PasswordSalt, user.PasswordHash);
                if (!isValid)
                {
                    var WrongPasswdresp = new
                    {
                        Message="Wrong Password"
                    };
                    return BadRequest(WrongPasswdresp);
                }

                var SuccessResp = new
                {
                    Message="Login Successful !",
                    user

                };
                return Ok(SuccessResp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("register")]
        public async Task<IActionResult> register(RegisterDTO registerDTO)
        {
            try
            {
                Console.WriteLine(registerDTO.Image);
                var initDate = registerDTO.InitDate;
                var fcode = registerDTO.FirstName[0].ToString().ToUpper() + registerDTO.FirstName[1].ToString().ToUpper();
                var lcode = registerDTO.LastName[0].ToString().ToUpper() + registerDTO.LastName[1].ToString().ToUpper();
                var userID = initDate.Year.ToString() + fcode + lcode + initDate.Day.ToString();
                var passwordString = registerDTO.FirstName + "@123";
                var passwd = _password.GetHash(passwordString);

                var user = new User()
                {
                    UserId = userID.ToString(),
                    Email = registerDTO.Email,
                    FirstName = registerDTO.FirstName,
                    LastName = registerDTO.LastName,
                    MiddleName = registerDTO.MiddleName,
                    ProfileUrl = registerDTO.Image,
                    PasswordHash = passwd[0],
                    PasswordSalt = passwd[1],
                    FlatNo = registerDTO.FlatNo,
                    State = registerDTO.State,
                    Street = registerDTO.Street,
                    City = registerDTO.City,
                    Pincode = registerDTO.Pincode,
                    InitDate = registerDTO.InitDate,
                    RoleId = 2
                };
                await _user.Add(user);

                var rec = user.Email;
                var sub = "Welcome to Buddha Spiritual Center";
                var body = $"Hello {user.FirstName}, \n\n\t Welcome to to Buddha Spiritual Center.\n\nPlease find your credentials below\n\nUsername:\t{user.UserId}\nPassword:\t{passwordString}\n\n\nThanks and Regards\nBuddha Spiritual Center";
                _email.SendMail(rec, sub, body);

                var SuccessRegresp = new
                {
                    message = "Registration Successfull !"
                };
                return Ok(SuccessRegresp);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException.Message);
                return BadRequest(ex.Message);
            }
        }

        //[HttpPost("admin")]
        //public async Task<IActionResult> registerAdmin()
        //{
        //    try
        //    {
        //        var profileURL = "https://s3.ap-south-1.amazonaws.com/2717-nirmal.s-feb23dotnet/admin.jfif";
        //        var initDate = DateTime.Now;
        //        var userID = "admin";
        //        var passwordString = "admin";
        //        var passwd = _password.GetHash(passwordString);

        //        var user = new User()
        //        {
        //            UserId = userID,
        //            Email = "sampatharshit03@gmail.com",
        //            FirstName = "admin",
        //            LastName = "admin",
        //            MiddleName = "admin",
        //            ProfileUrl = profileURL,
        //            PasswordHash = passwd[0],
        //            PasswordSalt = passwd[1],
        //            InitDate= initDate,
        //            FlatNo = "0",
        //            State = "admin",
        //            Street = "admin",
        //            City = "admin",
        //            Pincode = "admin",
        //            RoleId = 1
        //        };
        //        await _user.Add(user);

        //        var rec = user.Email;
        //        var sub = "Welcome to Buddha Spiritual Center";
        //        var body = $"Hello {user.FirstName}, \n\n\t Welcome to to Buddha Spiritual Center.\n\nYou are added as Admin. Please find your credentials below\n\nUsername:\t{user.UserId}\nPassword:\t{passwordString}\n\n\nThanks and Regards\nBuddha Spiritual Center";
        //        _email.SendMail(rec, sub, body);

        //        var resp = new
        //        {
        //            Message = "Registration Successfull !"
        //        };
        //        return Ok(resp);
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }
        //}

        [HttpPost("otp")]
        public async Task<IActionResult> genOtp(otpDTO otpdto)
        {
            Random random = new Random();
            int otp = random.Next(100000, 999999);
            var OtpStr = otp.ToString("D6");
            var users= await _user.GetAll();
            var user = users.FirstOrDefault(x=>x.Id==otpdto.id);
            user.LastOtp = OtpStr;
            await _user.Update(user, user.Id);
            var rec = user.Email;
            var sub = "OTP for Payment";
            var body = $"Hello {user.FirstName}, \n\n\t The One Time Password for your Payment is {OtpStr}";

            _email.SendMail(rec , sub, body);
            var otpresp = new
            {
                otp = OtpStr
            };
            return Ok(otpresp);
        }

        [HttpPost("pay")]
        public async Task<IActionResult> pay(PayDTO pay)
        {
            try
            {
                var users = await _user.GetAll();
                var user = users.FirstOrDefault(x => x.Id == pay.userID);

                if(pay.otp.Equals(user.LastOtp))
                {
                    var payment = new Payment()
                    {
                        Month = pay.month,
                        Year = pay.year,
                        Amount = Convert.ToDecimal(pay.amount),
                        UserId = pay.userID

                    };
                    await _payment.Add(payment);
                    var succResp = new
                    {
                        Message = $"Payment of amount {payment.Amount} is successfull",
                        payment
                    };
                    return Ok(succResp);
                }
                var wrongOtpResp = new
                {
                    Message = "Wrong OTP"
                };
                return BadRequest(wrongOtpResp);

                

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException.Message);
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("donations")]
        public async Task<IActionResult> donations()
        {
            try
            {
                var users = await _context.Users.Include(x=>x.Payments).ToListAsync();
                var resp = from u in users
                           where u.RoleId == 2
                           select new
                           {
                               u.Id,
                               Name = u.FirstName + " " + u.MiddleName + " " + u.LastName,
                               Address = u.FlatNo + " " + u.Street + " " + u.City + " " + u.State + " " + u.Pincode,
                               Total= u.Payments.Select(x=>x.Amount).Sum()
                           };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("donations/{id}")]
        public async Task<IActionResult> donations( int id)
        {
            try
            {
                var users = await _context.Users.Include(x => x.Payments).ToListAsync();
                var resp = from u in users
                           where u.Id == id
                           select new
                           {
                               u.Id,
                               Name = u.FirstName + " " + u.MiddleName + " " + u.LastName,
                               Address = u.FlatNo + " " + u.Street + " " + u.City + " " + u.State + " " + u.Pincode,
                               Payments = from p in u.Payments
                                          group p.Amount by new { p.Month, p.Year} into g
                                          select new
                                          {
                                             g.Key.Month, g.Key.Year, total = g.ToList().Sum(),
                                          }
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
