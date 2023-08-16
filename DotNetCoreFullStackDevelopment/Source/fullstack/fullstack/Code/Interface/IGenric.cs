namespace fullstack.Code.Interface
{
    public interface IGenric<T>
    {
        public Task<IEnumerable<T>> GetAll();
        public Task Add(T item);
        public Task Update(T item, int id);
        public Task Delete(T item);
        public Task<bool> isExist(int id);

    }
}
