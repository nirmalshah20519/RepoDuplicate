using MailKit.Net.Smtp;
using MimeKit;

namespace fullstack.Services
{
    public class Email
    {
        private readonly string Host = "mail.mailtest.radixweb.net";
        private readonly string UserName = "testdotnet@mailtest.radixweb.net";
        private readonly int Port = 465;
        private readonly string Password = "Radix@web#8";

        public void SendMail(string receptant, string subject, string body)
        {
            var msg = new MimeMessage();
            msg.From.Add(new MailboxAddress("Buddha Spiritual Center", UserName));
            msg.To.Add( new MailboxAddress("",receptant));
            msg.Subject=subject;

            var builder = new BodyBuilder();
            builder.TextBody = body;

            msg.Body=builder.ToMessageBody();

            var smtp = new SmtpClient();
            smtp.Connect(Host, Port);
            smtp.Authenticate(UserName, Password);
            smtp.Send(msg);
            smtp.Disconnect(true);


        }
    }
}
