using System;
using System.Collections.Generic;

namespace API.Models;

public partial class BookedTicket
{
    public int Id { get; set; }

    public int? BatchId { get; set; }

    public int? UserId { get; set; }

    public decimal? Amount { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public string? Status { get; set; }

    public bool? RowStatus { get; set; }

    public virtual Batch? Batch { get; set; }

    public virtual ICollection<BookedSeat> BookedSeats { get; set; } = new List<BookedSeat>();

    public virtual User? CreatedBy { get; set; }

    public virtual User? UpdateBy { get; set; }

    public virtual User? User { get; set; }
}
