using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RCast : Genric<Cast>, ICast
    {
        public RCast(BookMyShowContext context) : base(context)
        {
        }
    }
}
