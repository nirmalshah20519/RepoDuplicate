using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RScreenType : Genric<ScreenType>, IScreenType
    {
        public RScreenType(BookMyShowContext context) : base(context)
        {
        }
    }
}
