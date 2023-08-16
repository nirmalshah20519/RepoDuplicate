using System.Security.Cryptography;
using System.Text;

namespace fullstack.Services
{
    public class Password
    {
        public List<byte[]> GetHash(string password)
        {
            var hmac = new HMACSHA256();
            var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            var salt = hmac.Key;

            var response = new List<byte[]> { hash, salt };
            return response;
        }

        public bool Verify(string password, byte[] salt, byte[] dbhash)
        {
            var hmac = new HMACSHA256(salt);
            var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            return hash.SequenceEqual(dbhash);
        }
    }
}
