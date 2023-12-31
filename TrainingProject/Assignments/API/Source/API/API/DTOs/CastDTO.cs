﻿namespace API.DTOs
{
    public class CastDTO
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Description { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string ProfileUrl { get; set; }
        public DateTime DOB { get; set; }
    }
}
