using API.Models;

namespace API.Code.Interfaces
{
    public interface IUser:IGenric<User>
    {
        public Task<User?> GetByEmail(string email);
    }
}
