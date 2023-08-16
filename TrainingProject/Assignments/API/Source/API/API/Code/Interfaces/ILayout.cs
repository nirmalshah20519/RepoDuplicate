using API.Models;

namespace API.Code.Interfaces
{
    public interface ILayout:IGenric<Layout>
    {
        public Task AddLayout(List<Layout> layout);
    }
}
