using System.Collections;
using System.Security.Cryptography;
using System.Text;

namespace API.Services
{
    public class Password
    {
        public List<byte[]> PasswordHash(string password)
        {
             var hmac = new HMACSHA256();
             var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
             var salt = hmac.Key;
             var resp = new List<byte[]> {
                 hash,
                salt
             };
             return resp;            
        }

        public bool CheckPassword(string password, byte[] salt, byte[] dbhash)
        {
            var hmac = new HMACSHA256(salt);
            var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            return hash.SequenceEqual(dbhash);

        }

        
    }
}
