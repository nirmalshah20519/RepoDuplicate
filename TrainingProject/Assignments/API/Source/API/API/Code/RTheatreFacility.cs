using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RTheatreFacility : Genric<TheatreFacility>, ITheatreFacility
    {
        public RTheatreFacility(BookMyShowContext context) : base(context)
        {
        }
    }
}
