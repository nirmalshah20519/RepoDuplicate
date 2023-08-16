using API.Code;
using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using API.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static NHibernate.Engine.Query.CallableParser;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TheatreController : ControllerBase
    {
        private readonly IFacility _facility;
        private readonly ITheatre _theatre;
        private readonly ITheatreFacility _theatreFacility;
        private readonly EmailService _email;
        private readonly IUser _user;

        public TheatreController(IFacility facility, ITheatre theatre, ITheatreFacility theatreFacility, EmailService email, IUser user)
        {
            _facility = facility;
            _theatre = theatre;
            _theatreFacility = theatreFacility;
            _email = email;
            _user = user;
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddFac(FacilityDTO facilityDTO)
        {
            try
            {
                var f = new Facility()
                {
                    Name=facilityDTO.name,
                    Icon=facilityDTO.url
                };
                var fac= await _facility.CreateAsync(f);
                return Created("Facility Added", fac);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("facilities")]
        public async Task<IActionResult> GetFacilities()
        {
            try
            {
                var fac = from f in _facility.GetAll()
                          select new
                          {
                              id=f.Id,
                              name=f.Name,
                              url=f.Icon
                          };
                return Ok(fac);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("theatres/{uid}")]
        public async Task<IActionResult> GetTheatres(int uid)
        {
            try
            {
                var theatres = from t in _theatre.GetAll() where t.CreatedById==uid select new
                {
                    t.Id,
                    t.Name,
                    t.Street,
                    t.City,
                    t.State,
                    t.Country,
                    facilities=from f in _facility.GetAll()
                               join tf in _theatreFacility.GetAll() on f.Id equals tf.FacilityId
                               where tf.TheatureId == t.Id
                               select new { f.Id, f.Name, url=f.Icon}
                };
                return Ok(theatres);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost("addTheatre")]
        public async Task<IActionResult> AddTheatre(TheatreDto theatreDto)
        {
            try
            {
                var theatre = new Theatre()
                {
                    Name=theatreDto.name,
                    Street=theatreDto.street,
                    City=theatreDto.city,
                    State=theatreDto.state,
                    Country=theatreDto.country,
                    MinTicketPrice=theatreDto.minprice,
                    CreatedById=Convert.ToInt32(theatreDto.uid),
                    UpdateById=Convert.ToInt32(theatreDto.uid)
                };
                var t = await _theatre.CreateAsync(theatre);
                var tid= t.Id;

                foreach (var item in theatreDto.facilities)
                {
                    var tf = new TheatreFacility()
                    {
                        TheatureId=tid,
                        FacilityId=item
                    };
                   await _theatreFacility.CreateAsync(tf);
                }
                var resp = new
                {
                    message = "Theatre Added!",
                    Theatre=t
                };
                var user = await _user.GetByID((int) t.CreatedById);
                _email.TheatreAddedMail(user, t);
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
