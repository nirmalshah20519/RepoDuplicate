using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RMovieCast : Genric<Moviecast>, IMovieCast
    {
        public RMovieCast(BookMyShowContext context) : base(context)
        {
        }
    }
}
