using API.Models;

namespace API.DTOs
{
    public class role
    {
        public int cid { get; set; }
        public int rid { get; set; }
    }
    public class MovieDTO
    {
        public string MovieName { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseDate { get; set; }
        public string IMDB { get; set; }
        public int DurationHr { get; set; }
        public int DurationMin { get; set; }
        public string Poster { get; set; }
        public string Trailer { get; set; }
        public IEnumerable<int> Genre { get; set; }
        public IEnumerable<int> Language { get; set; }
        public IEnumerable<role> Casts { get; set; }

    }
}

//{
//    "MovieName": "Bholaa",
//    "Description": "Rajiv Hari Om Bhatia (born 9 September 1967), known professionally as Akshay Kumar, is an Indian-born naturalised Canadian actor and film producer who works in Hindi cinema. In over 30 years of acting, Kumar has appeared in over 100 films and has won several awards, including two National Film Awards and two Filmfare Awards. He received the Padma Shri, India's fourth-highest civilian honour, from the Government of India in 2009. Kumar is one of the most prolific actors in Indian cinema. Forbes included Kumar in their lists of both highest-paid celebrities and highest-paid actors in the world from 2015 to 2020. Between 2019 and 2020, he was the only Indian on both lists.",
//    "ReleaseDate": "2023-06-24",
//    "IMDB": "7.8",
//    "DurationHr": 2,
//    "DurationMin": 32,
//    "Poster": "https://res.cloudinary.com/movie-booking-site/image/upload/v1685611479/movie/posters/bholaa.jpg1685611479044.jpg",
//    "Trailer": "https://res.cloudinary.com/movie-booking-site/video/upload/v1685611477/movie/trailers/bholaa_trailer.mp41685611470174.mp4",
//    "gen": [
//        1,
//        3
//    ],
//    "lang": [
//        18
//    ],
//    "roles": [
//        {
//        "cid": "101",
//            "rid": "1"
//        },
//        {
//        "cid": "102",
//            "rid": "2"
//        }
//    ]
//}
