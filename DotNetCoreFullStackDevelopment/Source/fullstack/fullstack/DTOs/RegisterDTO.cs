using fullstack.Models;

namespace fullstack.DTOs
{
    public class RegisterDTO
    {
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public string FlatNo { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pincode { get; set; }
        public DateTime InitDate { get; set; }

    }
}

//SELECT TOP(1000) [ID]
//      ,[UserID]
//      ,[PasswordHash]
//      ,[PasswordSalt]
//      ,[Email]
//      ,[RoleID]
//      ,[FirstName]
//      ,[MiddleName]
//      ,[LastName]
//      ,[ProfileURL]
//      ,[FlatNo]
//      ,[Street]
//      ,[City]
//      ,[State]
//      ,[Pincode]
//      ,[LastOTP]
//FROM[FullStackExam].[dbo].[USER]