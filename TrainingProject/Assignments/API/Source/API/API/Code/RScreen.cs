using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RScreen : Genric<Screen>, IScreen
    {
        public RScreen(BookMyShowContext context) : base(context)
        {
        }
    }
}
