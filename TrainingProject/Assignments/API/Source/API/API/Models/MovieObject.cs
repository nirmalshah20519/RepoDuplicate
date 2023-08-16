using System;
using System.Collections.Generic;

namespace API.Models;

public partial class MovieObject
{
    public int Id { get; set; }

    public int? MovieId { get; set; }

    public int? ObjectId { get; set; }

    public int? ObjectTypeId { get; set; }

    public bool? Status { get; set; }

    public virtual Movie? Movie { get; set; }

    public virtual ObjectName? Object { get; set; }

    public virtual ObjectType? ObjectType { get; set; }
}
