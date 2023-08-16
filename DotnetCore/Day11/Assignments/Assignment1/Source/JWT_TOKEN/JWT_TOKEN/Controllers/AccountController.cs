using JWT_TOKEN.DTOs;
using JWT_TOKEN.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace JWT_TOKEN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class AccountController : ControllerBase
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly DemoContext _demoContext;
        private readonly IConfiguration _config;

        public AccountController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, DemoContext demoContext, IConfiguration config)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _demoContext = demoContext;
            _config = config;

        }

        [HttpGet("hello")]
        public async Task<IActionResult> get()
        {
            return Ok("Hello World !");
        }

        [Authorize(AuthenticationSchemes = "Bearer")]

        [HttpGet("admin")]
        public async Task<IActionResult> admin()
        {
            return Ok("Hello World !");
        }




        [HttpPost("signup")]
        public async Task<IActionResult> register([FromBody] registerDTO registerDTO)
        {
            try
            {
                AppUser user = new()
                {
                    Name = registerDTO.Name,
                    Email = registerDTO.Email,
                    UserName = registerDTO.Email.Split('@')[0],
                    NormalizedEmail = registerDTO.Email.ToUpper(),
                    NormalizedUserName = registerDTO.Email.Split('@')[0].ToUpper()
                };

                var result = await _userManager.CreateAsync(user, registerDTO.Password);
                if(result.Succeeded) 
                {
                    if (!_roleManager.RoleExistsAsync("admin").GetAwaiter().GetResult())
                    {
                        await _roleManager.CreateAsync(new IdentityRole("admin"));
                        await _roleManager.CreateAsync(new IdentityRole("customer"));
                    }
                    await _userManager.AddToRoleAsync(user, registerDTO.Role.ToLower());

                    var retObj = await _demoContext.Users.FirstOrDefaultAsync(x=>x.Email== registerDTO.Email);
                    return Ok(retObj);
                }
                return BadRequest("User Not Regisatered");

            }
            catch(Exception ex) { 
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> login([FromBody] LoginDTO loginDTO)
        {
            try
            {
                var user = await _demoContext.Users.FirstOrDefaultAsync(x=>x.Email== loginDTO.Email);
                bool isValid= await  _userManager.CheckPasswordAsync((AppUser)user, loginDTO.Password);

                if(User==null || isValid == false)
                {
                    return BadRequest("Invalid Username / Password");
                }

                var role = await _userManager.GetRolesAsync((AppUser)user);

                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.Name),
                    new Claim(ClaimTypes.Email, user.Email),
                    new Claim(ClaimTypes.Role, role.FirstOrDefault())

                };

                SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["TokenKey"]));
                var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(claims),
                    Expires = DateTime.Now.AddMinutes(5),
                    SigningCredentials = cred
                };
                var tokenHandler = new JwtSecurityTokenHandler();
                var token = tokenHandler.CreateToken(tokenDescriptor);
                var resp = new
                {
                    Status = "Login Successfull",
                    Token = tokenHandler.WriteToken(token),

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
