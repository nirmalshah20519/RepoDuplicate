using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScreenController : ControllerBase
    {
        private readonly IScreenType _screenType;
        private readonly IScreen _screen;
        private readonly ITheatre _theatre;

        public ScreenController(IScreenType screenType, IScreen screen, ITheatre theatre)
        {
            _screenType = screenType;
            _screen = screen;
            _theatre = theatre;
        }

        [HttpGet("screentypes")]
        public async Task<IActionResult> GetScreenTypes()
        {
            try
            {
                var resp = from st in _screenType.GetAll()
                           select new { st.Id, st.Name };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddScreen(ScreenDTO screenDTO)
        {
            try
            {
                var type = Convert.ToInt32(screenDTO.type);
                var theatre = await  _theatre.GetByID(screenDTO.tid);
                var screenType = await _screenType.GetByID(type);
                var screen = new Screen()
                {
                    Name=screenDTO.name,
                    ScreenTypeId=Convert.ToInt32( screenDTO.type),
                    TheaterId=screenDTO.tid,
                    ScreenBasePrice= Convert.ToDecimal(theatre.MinTicketPrice*screenType.Factor),
                    CreatedById=Convert.ToInt32(screenDTO.uid),
                    UpdateById=Convert.ToInt32(screenDTO.uid)
                };
                var s = await _screen.CreateAsync(screen);
                return Created("Added", s);

            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("all/{tid}")]
        public async Task<IActionResult> GetScreen(int tid)
        {
            try
            {
                var screens = from s in _screen.GetAll()
                             join st in _screenType.GetAll() on s.ScreenTypeId equals st.Id
                             where s.TheaterId == tid
                             select new
                             {
                                 id=s.Id,
                                 name=s.Name,
                                 type=st.Name,
                                 baseprice=s.ScreenBasePrice
                             };
                return Ok(screens);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
