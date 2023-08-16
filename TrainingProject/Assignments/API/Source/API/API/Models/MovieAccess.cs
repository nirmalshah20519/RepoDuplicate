using System;
using System.Collections.Generic;

namespace API.Models;

public partial class MovieAccess
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public int? MovieId { get; set; }

    public bool? IsApproved { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public virtual User? CreatedBy { get; set; }

    public virtual Movie? Movie { get; set; }

    public virtual User? UpdateBy { get; set; }

    public virtual User? User { get; set; }
}
