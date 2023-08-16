using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Role
{
    public int RoleId { get; set; }

    public string Role1 { get; set; } = null!;

    public bool? Status { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
