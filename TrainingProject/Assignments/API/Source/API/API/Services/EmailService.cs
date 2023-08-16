using API.Code.Interfaces;
using API.DTOs;
using API.Models;
using MailKit.Net.Smtp;
using MimeKit;

namespace API.Services
{
    public class EmailService
    {
        private readonly IConfiguration _config;
        private readonly IUser _user;

        public EmailService(IConfiguration config, IUser user)
        {
            _config = config;
            _user=user;
        }

        public void TheatreAddedMail(User u, Theatre t)
        {
            var subject = "Congratulations on Adding Your Theatre to Our Movie Booking Site!";
                var mailBody = File.ReadAllText("Templates/TheatreAdd.html");
            var theatreDetail = t.Name + ", " + t.Street + " " + t.City;
                mailBody = mailBody.Replace("[##User]", u.FirstName);
                mailBody = mailBody.Replace("[##tdetails]", theatreDetail);
            var html = new TextPart("html")
                {
                    Text = mailBody
                };
                sendEmail(u.Email, subject, html);
            
        }


        public void sendWelcomeEmail(User u)
        {
            var subject = "Welcome to BookMyShow";
            if (u.RoleId == (int) Roles.RolesName.User)
            {
                var mailBody = File.ReadAllText("Templates/WelcomeMail.html");
                mailBody = mailBody.Replace("##u", u.FirstName);
                var html = new TextPart("html")
                {
                    Text = mailBody
                };
                sendEmail(u.Email, subject, html);
                Console.WriteLine("User Email");
            }
            if(u.RoleId == (int)Roles.RolesName.TheatreAdmin)
            {
                var mailBody = File.ReadAllText("Templates/TheatreAdminWelcomePage.html");
                mailBody = mailBody.Replace("[#USER#]", u.FirstName);
                var html = new TextPart("html")
                {
                    Text = mailBody
                };
                sendEmail(u.Email, subject, html);
                Console.WriteLine("Theatre Admin Email");
            }
        }
        public async Task<string> SendResetPasswordOTP(User u)
        {
            var subject = "Password Reset OTP - Action Required";
            var mailBody = File.ReadAllText("Templates/ResetPasswordOtp.html");
            Random random = new Random();
            int otp = random.Next(100000, 999999);
            var OtpStr = otp.ToString("D6");
            mailBody = mailBody.Replace("##u", u.FirstName);
            mailBody =mailBody.Replace("##otp", OtpStr);
            var html = new TextPart("html")
            {
                Text = mailBody
            };            
            sendEmail(u.Email,subject,html);
            return OtpStr;
        }
        private void sendEmail(string receiver, string subject, TextPart body)
        {
            var host = _config.GetSection("Email:host").Value;
            var p = _config.GetSection("Email:port").Value;
            int port = Convert.ToInt32(p);
            var emailID = _config.GetSection("Email:id").Value;
            var password = _config.GetSection("Email:password").Value;
            var name = _config.GetSection("Email:name").Value;

            var msg = new MimeMessage();
            msg.From.Add(new MailboxAddress(name, emailID));
            msg.To.Add(new MailboxAddress("", receiver));
            msg.Subject = subject;

            var b = new BodyBuilder();
            msg.Body = body;

            var client = new SmtpClient();
            client.Connect(host, port);
            client.Authenticate(emailID, password);
            client.Send(msg);
            client.Disconnect(true);
            client.Dispose();
            Console.WriteLine("Email Sent");

        }
    }
}
