using fullstack.Code.Interface;
using fullstack.Models;

namespace fullstack.Code
{
    public class RUser : Genric<User>, IUser
    {
        public RUser(FullStackExamContext context) : base(context)
        {
        }
    }
}
