using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RMovieAccess : Genric<MovieAccess>, IMovieAccess
    {
        public RMovieAccess(BookMyShowContext context) : base(context)
        {
        }
    }
}
