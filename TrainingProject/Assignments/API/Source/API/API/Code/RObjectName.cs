using API.Code.Interfaces;
using API.Models;

namespace API.Code
{
    public class RObjectName : Genric<ObjectName>, IObjectName
    {
        public RObjectName(BookMyShowContext context) : base(context)
        {
        }
    }
}
