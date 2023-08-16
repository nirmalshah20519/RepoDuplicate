using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using Microsoft.EntityFrameworkCore;


namespace API.Code
{
    public class RMovie : Genric<Movie>, IMovie
    {
        private readonly BookMyShowContext _context;
        public RMovie(BookMyShowContext context) : base(context)
        {
            _context=context;
        }

    }
}
