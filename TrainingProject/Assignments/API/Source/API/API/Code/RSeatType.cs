using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RSeatType : Genric<SeatType>, ISeatType
    {
        public RSeatType(BookMyShowContext context) : base(context)
        {
        }
    }
}
