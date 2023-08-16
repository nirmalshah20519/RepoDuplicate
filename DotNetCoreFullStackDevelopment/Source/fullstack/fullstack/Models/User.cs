using System;
using System.Collections.Generic;

namespace fullstack.Models;

public partial class User
{
    public int Id { get; set; }

    public string UserId { get; set; } = null!;

    public byte[]? PasswordHash { get; set; }

    public byte[]? PasswordSalt { get; set; }

    public string? Email { get; set; }

    public int? RoleId { get; set; }

    public string FirstName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string ProfileUrl { get; set; } = null!;

    public string FlatNo { get; set; } = null!;

    public string Street { get; set; } = null!;

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string Pincode { get; set; } = null!;

    public string? LastOtp { get; set; }

    public DateTime InitDate { get; set; }

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Role? Role { get; set; }
}
