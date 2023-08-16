using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RFacility : Genric<Facility>, IFacility
    {
        
        public RFacility(BookMyShowContext context) : base(context)
        {
        }

        
    }
}
