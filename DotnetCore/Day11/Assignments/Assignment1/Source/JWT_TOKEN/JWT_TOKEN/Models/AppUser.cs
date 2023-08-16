using Microsoft.AspNetCore.Identity;

namespace JWT_TOKEN.Models
{
    public class AppUser:IdentityUser
    {
        public string Name { get; set; }

        public static explicit operator AppUser(Task<AppUser?> v)
        {
            throw new NotImplementedException();
        }
    }
}
