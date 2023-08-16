using API.Code;
using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly IMovie _movie;
        private readonly BookMyShowContext _context;
        private readonly IMovieRole _movRole;
        private readonly IMovieObject _movObj;
        private readonly IMovieCast _movCast;
        private readonly IObjectName _objectName;
        private readonly ICast _cast;
        private readonly IMovieAccess _movieAccess;

        public MoviesController(ICast cast, IMovieAccess movieAccess, IMovie movie, IMovieRole movRole, IMovieObject movObj, IMovieCast movCast, IObjectName objectName, BookMyShowContext context)
        {
            _movie=movie;
            _context=context;
            _movRole = movRole;
            _movObj=movObj;
            _movCast=movCast;
            _objectName = objectName;
            _cast = cast;
            _movieAccess = movieAccess;
        }

        [HttpGet("Genres")]
        public async Task<IActionResult> GetGenres() 
        {
            var genres =  await _context.GetGenres();
            var response = from d in genres
                           select new
                           {
                               id = d.Id,
                               typeName = d.TypeName
                           };
            return Ok( response);
        }

        [HttpGet("Languages")]
        public async Task<IActionResult> GetLanguages()
        {
            var languages = await _context.GetLanguages();
            var response = from d in languages
                           select new
                           {
                               id = d.Id,
                               typeName = d.TypeName
                           };
            return Ok(response);
        }

        [HttpGet("Rolelist")]
        public async Task<IActionResult> getRoleList()
        {
            try
            {
                var roles = _movRole.GetAll();
                var resp = from r in roles
                           select new
                           {
                                r.Id,
                                r.Name
                           };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return Ok(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> getMovie(int id)
        {
            try
            {
                var m = await _movie.GetByID(id);
                var obj = _movObj.GetAll();
                var casts = _cast.GetAll();
                var roles = _movRole.GetAll();
                var movCast = _movCast.GetAll();
                var objName = _objectName.GetAll();
                var resp = new
                {
                    m.Id,
                    m.Name,
                    m.Description,
                    m.Duration,
                    m.ReleaseDate,
                    m.ImdbRating,
                    m.TrailerLink,
                    m.PosterLink,
                    cast = from mo in movCast
                           join c in casts on mo.CastId equals c.Id
                           join r in roles on mo.RoleId equals r.Id
                           where mo.MovieId == m.Id
                           select new
                           {
                               castId = c.Id,
                               castName = c.Name,
                               roleId = r.Id,
                               roleName = r.Name,
                               castProfile=c.ProfileUrl
                           },
                    detail = from mob in obj
                             join o in objName on mob.ObjectId equals o.Id
                             where mob.MovieId == m.Id
                             select new
                             {
                                 o.Id,
                                 o.TypeName,
                                 o.TypeId
                             }
                };
                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        public async Task<IActionResult> getMovies()
        {
            try
            {
                var movies = _movie.GetAll();
                var obj = _movObj.GetAll();
                var casts = _cast.GetAll();
                var roles = _movRole.GetAll();
                var movCast = _movCast.GetAll();
                var objName = _objectName.GetAll();               
                var resp = from i in movies
                           select new
                           {
                               i.Id,
                               i.Name,
                               i.Description,
                               i.Duration,
                               i.ReleaseDate,
                               i.ImdbRating,
                               i.TrailerLink,
                               i.PosterLink,
                               cast = from mo in movCast
                                      join c in casts on mo.CastId equals c.Id
                                      join r in roles on mo.RoleId equals r.Id
                                      where mo.MovieId == i.Id
                                      select new
                                      {
                                          castId = c.Id,
                                          castName = c.Name,
                                          roleId=r.Id,
                                          roleName = r.Name
                                      },
                               detail = from mob in obj
                                        join o in objName on mob.ObjectId equals o.Id
                                        where mob.MovieId == i.Id
                                        select new
                                        {
                                            o.Id,
                                            o.TypeName,
                                            o.TypeId
                                        }
                           };

                return Ok(resp);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("requested/{userId}")]
        public async Task<IActionResult> getRequestedMovies(int userId)
        {
            try
            {
                var movies = _movie.GetAll();
                var obj = _movObj.GetAll();
                var casts = _cast.GetAll();
                var roles = _movRole.GetAll();
                var movCast = _movCast.GetAll();
                var objName = _objectName.GetAll();
                var MovieAccess = _movieAccess.GetAll();
                var resp = from i in movies
                           join ma in MovieAccess on i.Id equals ma.MovieId
                           where ma.UserId==userId && ma.IsApproved==false
                           select new
                           {
                               i.Id,
                               i.Name,
                               i.Description,
                               i.Duration,
                               i.ReleaseDate,
                               i.ImdbRating,
                               i.TrailerLink,
                               i.PosterLink,
                               cast = from mo in movCast
                                      join c in casts on mo.CastId equals c.Id
                                      join r in roles on mo.RoleId equals r.Id
                                      where mo.MovieId == i.Id
                                      select new
                                      {
                                          castId = c.Id,
                                          castName = c.Name,
                                          roleId = r.Id,
                                          roleName = r.Name
                                      },
                               detail = from mob in obj
                                        join o in objName on mob.ObjectId equals o.Id
                                        where mob.MovieId == i.Id
                                        select new
                                        {
                                            o.Id,
                                            o.TypeName,
                                            o.TypeId
                                        }
                           };

                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("approved/{userId}")]
        public async Task<IActionResult> getApprovedMovies(int userId)
        {
            try
            {
                var movies = _movie.GetAll();
                var obj = _movObj.GetAll();
                var casts = _cast.GetAll();
                var roles = _movRole.GetAll();
                var movCast = _movCast.GetAll();
                var objName = _objectName.GetAll();
                var MovieAccess = _movieAccess.GetAll();
                var resp = from i in movies
                           join ma in MovieAccess on i.Id equals ma.MovieId
                           where ma.UserId == userId && ma.IsApproved==true
                           select new
                           {
                               i.Id,
                               i.Name,
                               i.Description,
                               i.Duration,
                               i.ReleaseDate,
                               i.ImdbRating,
                               i.TrailerLink,
                               i.PosterLink,
                               cast = from mo in movCast
                                      join c in casts on mo.CastId equals c.Id
                                      join r in roles on mo.RoleId equals r.Id
                                      where mo.MovieId == i.Id
                                      select new
                                      {
                                          castId = c.Id,
                                          castName = c.Name,
                                          roleId = r.Id,
                                          roleName = r.Name
                                      },
                               detail = from mob in obj
                                        join o in objName on mob.ObjectId equals o.Id
                                        where mob.MovieId == i.Id
                                        select new
                                        {
                                            o.Id,
                                            o.TypeName,
                                            o.TypeId
                                        }
                           };

                return Ok(resp);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        //[Authorize(AuthenticationSchemes = "Bearer",Roles ="Admin")]
        [HttpPost]
        public async Task<IActionResult> postMovieData(MovieDTO movieDTO)
        {
            try
            {
                //string authorizationHeader = Request.Headers["Authorization"];
                //if (!string.IsNullOrEmpty(authorizationHeader) && authorizationHeader.StartsWith("Bearer "))
                if(true)
                {
                    //string token = authorizationHeader.Substring("Bearer ".Length);


                    var movie = new Movie()
                    {
                        Name = movieDTO.MovieName,
                        Description = movieDTO.Description,
                        TrailerLink = movieDTO.Trailer,
                        PosterLink = movieDTO.Poster,
                        ReleaseDate = movieDTO.ReleaseDate,
                        Duration = movieDTO.DurationHr.ToString() + " hr " + movieDTO.DurationMin.ToString() + " min",
                        ImdbRating = Convert.ToDecimal(movieDTO.IMDB),
                        CreatedById = 1002,
                        UpdateById = 1002
                    };
                    var movIe = await _movie.CreateAsync(movie);
                    var movies = _movie.GetAll();
                    var mid = from mov in movies
                              where mov.TrailerLink == movieDTO.Trailer
                              select mov.Id;
                    foreach (var gid in movieDTO.Genre)
                    {
                        var movObj = new MovieObject()
                        {
                            MovieId = mid.First(),
                            ObjectId = gid,
                            ObjectTypeId = 1
                        };
                        await _movObj.CreateAsync(movObj);
                    }

                    foreach (var lid in movieDTO.Language)
                    {
                        var movObj = new MovieObject()
                        {
                            MovieId = mid.First(),
                            ObjectId = lid,
                            ObjectTypeId = 2
                        };
                        await _movObj.CreateAsync(movObj);
                    }

                    foreach (var role in movieDTO.Casts)
                    {
                        var movCastObj = new Moviecast()
                        {
                            MovieId = mid.First(),
                            CastId = role.cid,
                            RoleId = role.rid,
                        };
                        await _movCast.CreateAsync(movCastObj);

                    }
                    var successResp = new
                    {
                        message = "Movie Added successfully !",
                        movie=movIe
                    };
                    return Ok(successResp);


                }
                else
                {
                    var resp = new
                    {
                        message = "Invalid Token"
                    };
                    return BadRequest(resp);
                }
                
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("requestmovie")]
        public async Task<IActionResult> Request(AccessRequestDTO requestDTO)
        {
            try
            {
                var req = new MovieAccess()
                {
                    MovieId=requestDTO.movId,
                    UserId=requestDTO.userId
                };
                var request = await _movieAccess.CreateAsync(req);
                return Ok(
                    new
                    {
                        Message = "Requested",
                        request
                    }
                    );
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
