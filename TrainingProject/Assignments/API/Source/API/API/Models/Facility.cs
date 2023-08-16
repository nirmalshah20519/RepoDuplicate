using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Facility
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Icon { get; set; } = null!;

    public bool? Status { get; set; }

    public virtual ICollection<TheatreFacility> TheatreFacilities { get; set; } = new List<TheatreFacility>();
}
