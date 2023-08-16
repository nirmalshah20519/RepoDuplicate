using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Batch
{
    public int Id { get; set; }

    public int? ScreenId { get; set; }

    public int? MovieId { get; set; }

    public DateTime ShowTime { get; set; }

    public decimal? Factor { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<BatchStatus> BatchStatuses { get; set; } = new List<BatchStatus>();

    public virtual ICollection<BookedTicket> BookedTickets { get; set; } = new List<BookedTicket>();

    public virtual User? CreatedBy { get; set; }

    public virtual Movie? Movie { get; set; }

    public virtual Screen? Screen { get; set; }

    public virtual User? UpdateBy { get; set; }
}
