using API.Code;
using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LayoutController : ControllerBase
    {
        private readonly ISeatType _seatType;
        private readonly ILayout _layout;
        private readonly IScreen _screen;

        public LayoutController(ISeatType seatType, ILayout layout, IScreen screen)
        {
            _seatType = seatType;
            _layout = layout;
            _screen = screen;
        }

        [HttpGet("seattypes")]
        public async Task<IActionResult> GetSeatTypes()
        {
            try
            {
                var resp = from st in _seatType.GetAll()
                           select new
                           {
                               id=st.Id,
                               name=st.Name,
                               factor=st.Factor
                           };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("LayoutExists/{sid}")]
        public async Task<IActionResult> LayoutExists(int sid)
        {
            try
            {
                var check = from Layout in _layout.GetAll()
                            where Layout.ScreenId == sid
                            select Layout;
                var resp = check.GroupBy(x => x.SeatTypeId).Select(group => new
                {
                    seatType = group.Key,
                    price = group.Average(x => x.BasePrice),
                    seatgroup = group.GroupBy(y => y.Row).Select(subgroup => new
                    {
                        row = subgroup.Key,
                        rowSeats = subgroup.Select(z => z.Col).ToList()
                    })
                });
                if(check.Any())
                {
                    return Ok(resp);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpPost("addlayout")]
        public async Task<IActionResult> AddLayout(LayoutPostDTO layoutPostDTO)
        {
            try
            {
                var AllSeats = new List<Layout>();
                var scrId = layoutPostDTO.sid;
                var inputLayout = layoutPostDTO.layout;
                var seatTypesID = (from st in _seatType.GetAll() select st.Id).ToList();
                var seatTypes = _seatType.GetAll();
                var screen = await _screen.GetByID(scrId);
                seatTypesID.ForEach(seatType =>
                {

                    var rows = inputLayout[seatType].Rows;
                    var seats = inputLayout[seatType].Seats;
                    var st = seatTypes.FirstOrDefault(s => s.Id == seatType);
                    if (rows != null && seats != null)
                    {
                        for (var row = 1; row <= rows; row++)
                        {
                            char r = (char)('A' + row - 1);
                            for (var seat = 1; seat <= seats; seat++)
                            {
                                var layout = new Layout()
                                {
                                    ScreenId = scrId,
                                    Row = r.ToString(),
                                    Col = seat,
                                    SeatTypeId = seatType,
                                    BasePrice = Convert.ToInt32(Math.Ceiling((st.Factor * screen.ScreenBasePrice) / 10)) * 10
                                };
                                AllSeats.Add(layout);
                            }
                        }
                    }

                });
                await _layout.AddLayout(AllSeats);
                var resp = new
                {
                    message = "Layout Added!"
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
