using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Screen
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? TheaterId { get; set; }

    public int? ScreenTypeId { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public decimal ScreenBasePrice { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<Batch> Batches { get; set; } = new List<Batch>();

    public virtual User? CreatedBy { get; set; }

    public virtual ICollection<Layout> Layouts { get; set; } = new List<Layout>();

    public virtual ScreenType? ScreenType { get; set; }

    public virtual Theatre? Theater { get; set; }

    public virtual User? UpdateBy { get; set; }
}
