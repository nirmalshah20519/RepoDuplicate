using fullstack.Code.Interface;
using fullstack.Models;

namespace fullstack.Code
{
    public class RPayment : Genric<Payment>, IPayment
    {
        public RPayment(FullStackExamContext context) : base(context)
        {
        }
    }
}
