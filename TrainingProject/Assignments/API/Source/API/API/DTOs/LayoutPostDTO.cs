namespace API.DTOs
{

    public class SeatLayout
    {
        public int? Rows { get; set; }
        public int? Seats { get; set; }
    }
    public class LayoutPostDTO
    {
        public int sid { get; set; }
        public Dictionary<int, SeatLayout> layout { get; set; }
    }
}
