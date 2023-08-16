using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Moviecast
{
    public int Id { get; set; }

    public int? MovieId { get; set; }

    public int? CastId { get; set; }

    public int? RoleId { get; set; }

    public virtual Cast? Cast { get; set; }

    public virtual Movie? Movie { get; set; }

    public virtual MovieRole? Role { get; set; }
}
