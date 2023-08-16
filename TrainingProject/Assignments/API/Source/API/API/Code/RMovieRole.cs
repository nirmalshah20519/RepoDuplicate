using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RMovieRole : Genric<MovieRole>, IMovieRole
    {
        public RMovieRole(BookMyShowContext context) : base(context)
        {
        }
    }
}
