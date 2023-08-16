namespace API.DTOs
{
    public class TheatreDto
    {
        public string uid { get; set; }
        public string name { get; set; }
        public string street { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public int minprice { get; set; }
        public List<int> facilities { get; set; }
    }
}
//{
//    "uid": "2013",
//    "name": "PVR Thaltej",
//    "street": "Thaltej",
//    "city": "Ahmedabad",
//    "state": "Gujarat",
//    "country": "India",
//    "facilities": [
//        1,
//        3
//    ]
//}