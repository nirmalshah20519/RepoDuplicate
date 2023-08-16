using fullstack.Code.Interface;
using fullstack.Models;
using Microsoft.EntityFrameworkCore;

namespace fullstack.Code
{
    public class Genric<T> : IGenric<T> where T : class
    {
        private readonly FullStackExamContext _context;
        private readonly DbSet<T> _dbset;

        public Genric(FullStackExamContext context)
        {
            _context = context;
            _dbset=_context.Set<T>();
        }
        public async Task Add(T item)
        {
            _dbset.Add(item);
            await _context.SaveChangesAsync();
        }

        public async Task Delete(T item)
        {
            _dbset.Remove(item);
            await _context.SaveChangesAsync(); 
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await _dbset.ToListAsync();
        }

        public async Task<bool> isExist(int id)
        {
            var exist = await _dbset.FindAsync(id);
            return (exist!=null);
        }

        public async Task Update(T item, int id)
        {
            var exist = await _dbset.FindAsync(id);
            if(exist!=null)
            {
                exist=item;
                await _context.SaveChangesAsync();
            }
        }
    }
}
