using System;
using System.Collections.Generic;

namespace API.Models;

public partial class ObjectName
{
    public int Id { get; set; }

    public string TypeName { get; set; } = null!;

    public int? TypeId { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<MovieObject> MovieObjects { get; set; } = new List<MovieObject>();

    public virtual ObjectType? Type { get; set; }
}
