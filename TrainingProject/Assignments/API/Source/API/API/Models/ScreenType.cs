using System;
using System.Collections.Generic;

namespace API.Models;

public partial class ScreenType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public decimal? Factor { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<Screen> Screens { get; set; } = new List<Screen>();
}
