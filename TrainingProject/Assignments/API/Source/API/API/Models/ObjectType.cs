using System;
using System.Collections.Generic;

namespace API.Models;

public partial class ObjectType
{
    public int Id { get; set; }

    public string TypeName { get; set; } = null!;

    public bool? Status { get; set; }

    public virtual ICollection<MovieObject> MovieObjects { get; set; } = new List<MovieObject>();

    public virtual ICollection<ObjectName> ObjectNames { get; set; } = new List<ObjectName>();
}
