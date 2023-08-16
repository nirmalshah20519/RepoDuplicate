using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RTheatre : Genric<Theatre>, ITheatre
    {
        public RTheatre(BookMyShowContext context) : base(context)
        {
        }
    }
}
