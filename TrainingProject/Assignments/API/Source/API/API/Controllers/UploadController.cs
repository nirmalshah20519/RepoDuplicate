using API.Code.Interfaces;
using API.Models;
using API.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly S3Upload _upload;
        private readonly BookMyShowContext _context;

        public UploadController(S3Upload upload, BookMyShowContext context)
        {
            _upload = upload;
            _context = context;
        }

        [HttpPost("trailer")]

        public async Task<IActionResult> UploadTrailer(IFormFile file)
        {
            try
            {
                var url = await _upload.UploadTrailer(file);
                var resp = new
                {
                    message = "Uploaded",
                    url
                };
                return  Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpPost("facility")]

        public async Task<IActionResult> UploadFacility(IFormFile file)
        {
            try
            {
                var url = await _upload.UploadFacility(file);
                var resp = new
                {
                    message = "Uploaded",
                    url
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("poster")]

        public async Task<IActionResult> UploadPoster(IFormFile file)
        {
            try
            {
                var url = await _upload.UploadPoster(file);
                var resp = new
                {
                    message = "Uploaded",
                    url
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("profile")]

        public async Task<IActionResult> UploadProfile(IFormFile file)
        {
            try
            {
                var url = await _upload.UploadProfile(file);
                var resp = new
                {
                    message = "Uploaded",
                    url
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }


    }
}
