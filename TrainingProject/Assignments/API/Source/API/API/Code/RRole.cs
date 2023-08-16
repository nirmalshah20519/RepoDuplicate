using API.Code.Interfaces;
using API.Models;
using Microsoft.AspNetCore.Mvc;

namespace API.Code
{
    public class RRole : Genric<Role>, IRole
    {
        public RRole(BookMyShowContext context) : base(context)
        {
        }
    }
}
