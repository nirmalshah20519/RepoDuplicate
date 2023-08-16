namespace API.Code.Interfaces
{
    public interface IGenric<T>
    {
        Task<T> CreateAsync(T item);
        Task UpdateAsync(T item, int id);
        Task DeleteAsync(T item);
        IEnumerable<T> GetAll();
        Task<T> GetByID(int id);
        bool IsExist(int id);
    }
}
