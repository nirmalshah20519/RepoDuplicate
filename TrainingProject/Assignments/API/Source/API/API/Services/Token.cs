using API.DTOs;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace API.Services
{
    public class Token
    {
        private readonly SymmetricSecurityKey _key;

        public Token(IConfiguration config)
        {
            _key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"]));
        }

        public int GetIDByToken(string token)
        {
            return 0;
        }

        public string CreateToken(TokenClaimDTO tokenDto, int m, int h, bool isMinute)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.PrimarySid, tokenDto.UserId.ToString()),
                new Claim(ClaimTypes.Name,tokenDto.Name),
                new Claim(ClaimTypes.Name,tokenDto.Email),
                new Claim(ClaimTypes.Role,tokenDto.Role)
            };

            var creds = new SigningCredentials(_key, SecurityAlgorithms.HmacSha256Signature);

            DateTime dateTime;
            if (isMinute)
            {
                dateTime = DateTime.Now.AddMinutes(m);
            }
            else
            {
                dateTime = DateTime.Now.AddHours(h);
            }
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = dateTime,
                SigningCredentials = creds
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }
    }
}
