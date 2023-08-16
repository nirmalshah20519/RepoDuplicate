using System;
using System.Collections.Generic;

namespace API.Models;

public partial class MovieRole
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public bool? Status { get; set; }

    public virtual ICollection<Moviecast> Moviecasts { get; set; } = new List<Moviecast>();
}
