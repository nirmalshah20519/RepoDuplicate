using API.Code.Interfaces;
using API.Models;
using Microsoft.EntityFrameworkCore;

namespace API.Code
{
    public class RUser : Genric<User>, IUser
    {

        private readonly BookMyShowContext _context;
        public RUser(BookMyShowContext context):base(context)
        {
            _context=context;
        }

        public async Task<User?> GetByEmail(string email)
        {
            var usr = await _context.Users.FirstOrDefaultAsync(x => x.Email == email);
            return usr;
        }
    }
}
