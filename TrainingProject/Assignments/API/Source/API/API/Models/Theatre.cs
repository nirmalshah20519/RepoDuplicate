using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Theatre
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Street { get; set; } = null!;

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string Country { get; set; } = null!;

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public decimal MinTicketPrice { get; set; }

    public bool? Status { get; set; }

    public virtual User? CreatedBy { get; set; }

    public virtual ICollection<Screen> Screens { get; set; } = new List<Screen>();

    public virtual ICollection<TheatreFacility> TheatreFacilities { get; set; } = new List<TheatreFacility>();

    public virtual User? UpdateBy { get; set; }
}
