namespace API.DTOs
{
    public class RegisterDTO
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public DateTime DOB { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string PhoneNo { get; set; }
        public int RoleID { get; set; }
    }
}
