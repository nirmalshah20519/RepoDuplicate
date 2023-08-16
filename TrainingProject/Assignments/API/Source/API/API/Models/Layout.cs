using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Layout
{
    public int Id { get; set; }

    public int? ScreenId { get; set; }

    public string Row { get; set; } = null!;

    public int Col { get; set; }

    public int BasePrice { get; set; }

    public int? SeatTypeId { get; set; }

    public bool? Status { get; set; }

    public virtual Screen? Screen { get; set; }

    public virtual SeatType? SeatType { get; set; }
}
