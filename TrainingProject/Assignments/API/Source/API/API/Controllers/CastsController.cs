using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CastsController : ControllerBase
    {
        private readonly ICast _cast;
        private readonly BookMyShowContext _context;

        public CastsController(ICast cast, BookMyShowContext context)
        {
            _cast = cast;
            _context=context;
        }

        [HttpPost]
        public async Task<IActionResult> postCast(CastDTO castDTO)
        {
            try
            {
                var cast = new Cast() {
                    Name = castDTO.Name,
                    Description = castDTO.Description,
                    Gender = castDTO.Gender.ToLower(),
                    Dob=castDTO.DOB,
                    City = castDTO.City.ToLower(),
                    State = castDTO.State.ToLower(),
                    Country = castDTO.Country.ToLower(),
                    ProfileUrl=castDTO.ProfileUrl,
                    CreatedById=1002,
                    UpdateById=1002                    
                };
                //await _context.Casts.Add(cast);
                var addedCast =await _cast.CreateAsync(cast);
                var resp = new
                {
                    message = "Cast Added",
                    cast=addedCast

                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Castlist")]
        public async Task<IActionResult> getCastList()
        {
            try
            {
                var casts = _cast.GetAll();
                var resp = from c in casts
                           orderby c.Name
                           select new
                           {
                               ID=c.Id, 
                               Name = c.Name
                           };
                return Ok(resp);
            }
            catch (Exception ex) 
            { 
                return Ok(ex.Message);
            }
        }

        

        [HttpGet("Castdata")]
        public async Task<IActionResult> getCastData()
        {
            try
            {
                var casts = _cast.GetAll();
                var resp = from c in casts
                           select new
                           {
                               c.Id, c.Name, c.Gender,c.City, c.State, c.Country,c.Description, c.ProfileUrl, c.Dob
                           };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return Ok(ex.Message);
            }
        }
    }
}
