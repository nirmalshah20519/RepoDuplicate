using System;
using System.Collections.Generic;

namespace API.Models;

public partial class BookedSeat
{
    public int Id { get; set; }

    public int? TicketId { get; set; }

    public string Row { get; set; } = null!;

    public int Col { get; set; }

    public decimal? Rate { get; set; }

    public bool? Status { get; set; }

    public virtual BookedTicket? Ticket { get; set; }
}
