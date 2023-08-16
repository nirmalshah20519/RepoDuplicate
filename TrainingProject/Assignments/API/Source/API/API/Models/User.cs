using System;
using System.Collections.Generic;

namespace API.Models;

public partial class User
{
    public int UserId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public DateTime Dob { get; set; }

    public string? Email { get; set; }

    public string? PhoneNo { get; set; }

    public byte[]? PasswordHash { get; set; }

    public byte[]? PasswordSalt { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? RoleId { get; set; }

    public string? LastOtp { get; set; }

    public bool? Status { get; set; }

    public virtual ICollection<Batch> BatchCreatedBies { get; set; } = new List<Batch>();

    public virtual ICollection<Batch> BatchUpdateBies { get; set; } = new List<Batch>();

    public virtual ICollection<BookedTicket> BookedTicketCreatedBies { get; set; } = new List<BookedTicket>();

    public virtual ICollection<BookedTicket> BookedTicketUpdateBies { get; set; } = new List<BookedTicket>();

    public virtual ICollection<BookedTicket> BookedTicketUsers { get; set; } = new List<BookedTicket>();

    public virtual ICollection<Cast> CastCreatedBies { get; set; } = new List<Cast>();

    public virtual ICollection<Cast> CastUpdateBies { get; set; } = new List<Cast>();

    public virtual ICollection<MovieAccess> MovieAccessCreatedBies { get; set; } = new List<MovieAccess>();

    public virtual ICollection<MovieAccess> MovieAccessUpdateBies { get; set; } = new List<MovieAccess>();

    public virtual ICollection<MovieAccess> MovieAccessUsers { get; set; } = new List<MovieAccess>();

    public virtual ICollection<Movie> MovieCreatedBies { get; set; } = new List<Movie>();

    public virtual ICollection<Movie> MovieUpdateBies { get; set; } = new List<Movie>();

    public virtual Role? Role { get; set; }

    public virtual ICollection<Screen> ScreenCreatedBies { get; set; } = new List<Screen>();

    public virtual ICollection<Screen> ScreenUpdateBies { get; set; } = new List<Screen>();

    public virtual ICollection<Theatre> TheatreCreatedBies { get; set; } = new List<Theatre>();

    public virtual ICollection<Theatre> TheatreUpdateBies { get; set; } = new List<Theatre>();
}
