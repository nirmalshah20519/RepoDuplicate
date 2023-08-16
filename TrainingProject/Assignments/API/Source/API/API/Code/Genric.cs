using API.Code.Interfaces;
using API.Models;
using Microsoft.EntityFrameworkCore;
using static Amazon.S3.Util.S3EventNotification;

namespace API.Code
{
    public class Genric<T> : IGenric<T> where T : class
    {
        private readonly BookMyShowContext _context;
        private readonly DbSet<T> _dbSet;

        public Genric(BookMyShowContext context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }
        public async Task<T> CreateAsync(T item)
        {
            await _dbSet.AddAsync(item);
            await _context.SaveChangesAsync();
            return item;
        }

        public async Task DeleteAsync(T item)
        {
            _dbSet.Remove(item);
            await _context.SaveChangesAsync();
        }

        public  IEnumerable<T> GetAll()
        {
            return  _dbSet.ToList();
        }

        public async Task<T?> GetByID(int id)
        {
            return await _dbSet.FindAsync(id);
        }

        public bool IsExist(int id)
        {
            var x = _dbSet.Find(id);
            return x != null;
        }

        public async Task UpdateAsync(T item, int id)
        {
            _dbSet.Update(item);
            await _context.SaveChangesAsync();
         
        }
    }
}
