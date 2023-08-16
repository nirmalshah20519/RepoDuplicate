using System;
using System.Collections.Generic;

namespace API.Models;

public partial class Movie
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public string Duration { get; set; } = null!;

    public decimal? ImdbRating { get; set; }

    public DateTime? ReleaseDate { get; set; }

    public string? PosterLink { get; set; }

    public string? TrailerLink { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? CreatedById { get; set; }

    public int? UpdateById { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<Batch> Batches { get; set; } = new List<Batch>();

    public virtual User? CreatedBy { get; set; }

    public virtual ICollection<MovieAccess> MovieAccesses { get; set; } = new List<MovieAccess>();

    public virtual ICollection<MovieObject> MovieObjects { get; set; } = new List<MovieObject>();

    public virtual ICollection<Moviecast> Moviecasts { get; set; } = new List<Moviecast>();

    public virtual User? UpdateBy { get; set; }
}
