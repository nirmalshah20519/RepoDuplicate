using System;
using System.Collections.Generic;

namespace API.Models;

public partial class BatchStatus
{
    public int Id { get; set; }

    public int? BatchId { get; set; }

    public string Row { get; set; } = null!;

    public int Col { get; set; }

    public int BatchPrice { get; set; }

    public bool IsBooked { get; set; }

    public bool? Status { get; set; }

    public virtual Batch? Batch { get; set; }
}
