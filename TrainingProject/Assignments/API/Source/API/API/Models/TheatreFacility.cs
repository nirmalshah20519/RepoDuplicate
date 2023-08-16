using System;
using System.Collections.Generic;

namespace API.Models;

public partial class TheatreFacility
{
    public int Id { get; set; }

    public int? TheatureId { get; set; }

    public int? FacilityId { get; set; }

    public bool? Status { get; set; }

    public virtual Facility? Facility { get; set; }

    public virtual Theatre? Theature { get; set; }
}
