using System;
using System.Collections.Generic;

namespace fullstack.Models;

public partial class Payment
{
    public int Id { get; set; }

    public DateTime? DateOfPayment { get; set; }

    public int Month { get; set; }

    public int Year { get; set; }

    public int? UserId { get; set; }

    public decimal Amount { get; set; }

    public virtual User? User { get; set; }
}
