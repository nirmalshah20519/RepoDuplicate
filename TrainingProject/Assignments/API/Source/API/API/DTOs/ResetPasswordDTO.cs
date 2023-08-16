namespace API.DTOs
{
    public class ResetPasswordDTO
    {
        public string NewPassword { get; set; }
        public string ConfirmNewPassword { get; set; }
        public string OTP { get; set; }
    }
}