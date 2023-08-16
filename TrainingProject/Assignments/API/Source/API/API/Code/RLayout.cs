using API.Code.Interfaces;
using API.Models;
using Microsoft.EntityFrameworkCore;

namespace API.Code
{
    public class RLayout : Genric<Layout>, ILayout
    {
        private readonly BookMyShowContext _context;
        private readonly DbSet<Layout> _dbset;

        public RLayout(BookMyShowContext context) : base(context)
        {
            _context = context;
            _dbset=_context.Set<Layout>();
        }

        public async Task AddLayout(List<Layout> layout)
        {
            await _dbset.AddRangeAsync(layout);
            await _context.SaveChangesAsync();  
        }

    }
}
