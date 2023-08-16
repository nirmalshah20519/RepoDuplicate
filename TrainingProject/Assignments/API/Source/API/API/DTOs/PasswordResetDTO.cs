namespace API.DTOs
{
    public class PasswordResetDTO
    {
        public string Email { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmNewPassword { get; set; }
        public string OTP { get; set; }
    }
}
