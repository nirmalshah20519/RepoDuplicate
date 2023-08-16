using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Cast
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Gender { get; set; } = null!;

    public DateTime Dob { get; set; }

    public string Description { get; set; } = null!;

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string Country { get; set; } = null!;

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public string ProfileUrl { get; set; } = null!;

    public bool? Status { get; set; }

    public virtual User? CreatedBy { get; set; }

    public virtual ICollection<Moviecast> Moviecasts { get; set; } = new List<Moviecast>();

    public virtual User? UpdateBy { get; set; }
}
