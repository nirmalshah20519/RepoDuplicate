using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RMovieObject : Genric<MovieObject>, IMovieObject
    {
        public RMovieObject(BookMyShowContext context) : base(context)
        {
        }
    }
}
