using API.Code.Interfaces;
using API.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static NHibernate.Engine.Query.CallableParser;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        private readonly IUser _user;
        private readonly ITheatre _theatre;
        private readonly EmailService _email;
        private readonly S3Upload _s3;

        public TestController(IUser user, ITheatre theatre, EmailService email, S3Upload s3)
        {
            _user = user;
            _theatre = theatre;
            _email = email;
            _s3 = s3;
        }

        [HttpGet]
        public async Task<IActionResult> TestMail()
        {
            var user = await _user.GetByID(2013);
            var theatre = await _theatre.GetByID(11);
            _email.TheatreAddedMail(user, theatre);
            return Ok("sent");
        }

        [HttpPost]
        public async Task<IActionResult> upload(IFormFile file)
        {
            var url=await _s3.Upload(file, "Assets");
            return Ok(url);
        }
    }
}
