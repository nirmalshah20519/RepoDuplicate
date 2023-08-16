using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace API.Models;

public partial class BookMyShowContext : DbContext
{
    public BookMyShowContext()
    {
    }

    public BookMyShowContext(DbContextOptions<BookMyShowContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Batch> Batches { get; set; }

    public virtual DbSet<BatchStatus> BatchStatuses { get; set; }

    public virtual DbSet<BookedSeat> BookedSeats { get; set; }

    public virtual DbSet<BookedTicket> BookedTickets { get; set; }

    public virtual DbSet<Cast> Casts { get; set; }

    public virtual DbSet<Facility> Facilities { get; set; }

    public virtual DbSet<Layout> Layouts { get; set; }

    public virtual DbSet<Movie> Movies { get; set; }

    public virtual DbSet<MovieAccess> MovieAccesses { get; set; }

    public virtual DbSet<MovieObject> MovieObjects { get; set; }

    public virtual DbSet<MovieRole> MovieRoles { get; set; }

    public virtual DbSet<Moviecast> Moviecasts { get; set; }

    public virtual DbSet<ObjectName> ObjectNames { get; set; }

    public virtual DbSet<ObjectType> ObjectTypes { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Screen> Screens { get; set; }

    public virtual DbSet<ScreenType> ScreenTypes { get; set; }

    public virtual DbSet<SeatType> SeatTypes { get; set; }

    public virtual DbSet<Theatre> Theatres { get; set; }

    public virtual DbSet<TheatreFacility> TheatreFacilities { get; set; }

    public virtual DbSet<User> Users { get; set; }

    // extra code

    public async Task<List<ObjectName>> GetGenres()
    {
        return await Set<ObjectName>().FromSqlRaw("EXEC GetGenres;").ToListAsync();
    }

    public async Task<List<ObjectName>> GetLanguages()
    {
        return await Set<ObjectName>().FromSqlRaw("EXEC GetLanguages;").ToListAsync();
    }

    // extra code
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=PC0751\\MSSQL2019;Database=BookMyShow;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Batch>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BATCH__3214EC27BFA28188");

            entity.ToTable("BATCH");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.Factor)
                .HasDefaultValueSql("((1))")
                .HasColumnType("decimal(1, 1)")
                .HasColumnName("FACTOR");
            entity.Property(e => e.MovieId).HasColumnName("MovieID");
            entity.Property(e => e.ScreenId).HasColumnName("ScreenID");
            entity.Property(e => e.ShowTime).HasColumnType("datetime");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.BatchCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__BATCH__CreatedBy__5FB337D6");

            entity.HasOne(d => d.Movie).WithMany(p => p.Batches)
                .HasForeignKey(d => d.MovieId)
                .HasConstraintName("FK__BATCH__MovieID__5BE2A6F2");

            entity.HasOne(d => d.Screen).WithMany(p => p.Batches)
                .HasForeignKey(d => d.ScreenId)
                .HasConstraintName("FK__BATCH__ScreenID__5AEE82B9");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.BatchUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__BATCH__UpdateByI__60A75C0F");
        });

        modelBuilder.Entity<BatchStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BATCH_ST__3214EC2798543766");

            entity.ToTable("BATCH_STATUS");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BatchId).HasColumnName("BatchID");
            entity.Property(e => e.Col).HasColumnName("COL");
            entity.Property(e => e.Row)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("ROW");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Batch).WithMany(p => p.BatchStatuses)
                .HasForeignKey(d => d.BatchId)
                .HasConstraintName("FK__BATCH_STA__Batch__6383C8BA");
        });

        modelBuilder.Entity<BookedSeat>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BookedSe__3214EC2727C12086");

            entity.ToTable("BookedSeat");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Col).HasColumnName("COL");
            entity.Property(e => e.Rate).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.Row)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("ROW");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.TicketId).HasColumnName("TicketID");

            entity.HasOne(d => d.Ticket).WithMany(p => p.BookedSeats)
                .HasForeignKey(d => d.TicketId)
                .HasConstraintName("FK__BookedSea__Ticke__6EF57B66");
        });

        modelBuilder.Entity<BookedTicket>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BOOKED_T__3214EC27DD7E900F");

            entity.ToTable("BOOKED_TICKETS");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Amount).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.BatchId).HasColumnName("BatchID");
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.RowStatus)
                .IsRequired()
                .HasDefaultValueSql("((1))")
                .HasColumnName("Row_Status");
            entity.Property(e => e.Status).IsUnicode(false);
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Batch).WithMany(p => p.BookedTickets)
                .HasForeignKey(d => d.BatchId)
                .HasConstraintName("FK__BOOKED_TI__Batch__6754599E");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.BookedTicketCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__BOOKED_TI__Creat__6B24EA82");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.BookedTicketUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__BOOKED_TI__Updat__6C190EBB");

            entity.HasOne(d => d.User).WithMany(p => p.BookedTicketUsers)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__BOOKED_TI__UserI__68487DD7");
        });

        modelBuilder.Entity<Cast>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__CAST__3214EC277D777A5D");

            entity.ToTable("CAST");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.City)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.Description).IsUnicode(false);
            entity.Property(e => e.Dob)
                .HasColumnType("date")
                .HasColumnName("DOB");
            entity.Property(e => e.Gender)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ProfileUrl).HasColumnName("ProfileURL");
            entity.Property(e => e.State)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.CastCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__CAST__CreatedByI__3B75D760");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.CastUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__CAST__UpdateByID__3C69FB99");
        });

        modelBuilder.Entity<Facility>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__FACILITY__3214EC27B9F6A342");

            entity.ToTable("FACILITY");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
        });

        modelBuilder.Entity<Layout>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__LAYOUT__3214EC272BD5E61F");

            entity.ToTable("LAYOUT");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Col).HasColumnName("COL");
            entity.Property(e => e.Row)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("ROW");
            entity.Property(e => e.ScreenId).HasColumnName("ScreenID");
            entity.Property(e => e.SeatTypeId).HasColumnName("SeatTypeID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Screen).WithMany(p => p.Layouts)
                .HasForeignKey(d => d.ScreenId)
                .HasConstraintName("FK__LAYOUT__ScreenID__571DF1D5");

            entity.HasOne(d => d.SeatType).WithMany(p => p.Layouts)
                .HasForeignKey(d => d.SeatTypeId)
                .HasConstraintName("FK__LAYOUT__SeatType__5812160E");
        });

        modelBuilder.Entity<Movie>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MOVIE__3214EC27EA0D84C4");

            entity.ToTable("MOVIE");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.Description).IsUnicode(false);
            entity.Property(e => e.Duration)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ImdbRating)
                .HasColumnType("decimal(4, 1)")
                .HasColumnName("IMDB_Rating");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ReleaseDate).HasColumnType("date");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.MovieCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__MOVIE__CreatedBy__2C3393D0");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.MovieUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__MOVIE__UpdateByI__2D27B809");
        });

        modelBuilder.Entity<MovieAccess>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MovieAcc__3214EC0754A7FB72");

            entity.ToTable("MovieAccess");

            entity.HasIndex(e => new { e.UserId, e.MovieId }, "UC_MovieAccess_UserId_MovieId").IsUnique();

            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.IsApproved)
                .HasDefaultValueSql("((0))")
                .HasColumnName("isApproved");
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.MovieAccessCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__MovieAcce__Creat__2DE6D218");

            entity.HasOne(d => d.Movie).WithMany(p => p.MovieAccesses)
                .HasForeignKey(d => d.MovieId)
                .HasConstraintName("FK__MovieAcce__Movie__2A164134");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.MovieAccessUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__MovieAcce__Updat__2EDAF651");

            entity.HasOne(d => d.User).WithMany(p => p.MovieAccessUsers)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__MovieAcce__UserI__29221CFB");
        });

        modelBuilder.Entity<MovieObject>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MovieObj__3214EC27D226FD58");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.MovieId).HasColumnName("MovieID");
            entity.Property(e => e.ObjectId).HasColumnName("ObjectID");
            entity.Property(e => e.ObjectTypeId).HasColumnName("ObjectTypeID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Movie).WithMany(p => p.MovieObjects)
                .HasForeignKey(d => d.MovieId)
                .HasConstraintName("FK__MovieObje__Movie__34C8D9D1");

            entity.HasOne(d => d.Object).WithMany(p => p.MovieObjects)
                .HasForeignKey(d => d.ObjectId)
                .HasConstraintName("FK__MovieObje__Objec__35BCFE0A");

            entity.HasOne(d => d.ObjectType).WithMany(p => p.MovieObjects)
                .HasForeignKey(d => d.ObjectTypeId)
                .HasConstraintName("FK__MovieObje__Objec__06CD04F7");
        });

        modelBuilder.Entity<MovieRole>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MOVIE_RO__3214EC278FD64B5A");

            entity.ToTable("MOVIE_ROLE");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
        });

        modelBuilder.Entity<Moviecast>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__MOVIECAS__3214EC27682FAF13");

            entity.ToTable("MOVIECAST");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CastId).HasColumnName("CastID");
            entity.Property(e => e.MovieId).HasColumnName("MovieID");
            entity.Property(e => e.RoleId).HasColumnName("RoleID");

            entity.HasOne(d => d.Cast).WithMany(p => p.Moviecasts)
                .HasForeignKey(d => d.CastId)
                .HasConstraintName("FK__MOVIECAST__CastI__02084FDA");

            entity.HasOne(d => d.Movie).WithMany(p => p.Moviecasts)
                .HasForeignKey(d => d.MovieId)
                .HasConstraintName("FK__MOVIECAST__Movie__01142BA1");

            entity.HasOne(d => d.Role).WithMany(p => p.Moviecasts)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK__MOVIECAST__RoleI__02FC7413");
        });

        modelBuilder.Entity<ObjectName>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ObjectNa__3214EC27E6CABF6A");

            entity.ToTable("ObjectName");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.TypeId).HasColumnName("TypeID");
            entity.Property(e => e.TypeName)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Type).WithMany(p => p.ObjectNames)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK__ObjectNam__TypeI__31EC6D26");
        });

        modelBuilder.Entity<ObjectType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ObjectTy__3214EC27B258D18B");

            entity.ToTable("ObjectType");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.TypeName)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__ROLE__8AFACE3A34608951");

            entity.ToTable("ROLE");

            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.Role1)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("Role");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
        });

        modelBuilder.Entity<Screen>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__SCREEN__3214EC2790743DC4");

            entity.ToTable("SCREEN");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ScreenBasePrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ScreenTypeId).HasColumnName("ScreenTypeID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.TheaterId).HasColumnName("TheaterID");
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.ScreenCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__SCREEN__CreatedB__4F7CD00D");

            entity.HasOne(d => d.ScreenType).WithMany(p => p.Screens)
                .HasForeignKey(d => d.ScreenTypeId)
                .HasConstraintName("FK__SCREEN__ScreenTy__4E88ABD4");

            entity.HasOne(d => d.Theater).WithMany(p => p.Screens)
                .HasForeignKey(d => d.TheaterId)
                .HasConstraintName("FK__SCREEN__TheaterI__4D94879B");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.ScreenUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__SCREEN__UpdateBy__5070F446");
        });

        modelBuilder.Entity<ScreenType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__SCREEN_T__3214EC27DD5DC72E");

            entity.ToTable("SCREEN_TYPE");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Factor)
                .HasDefaultValueSql("((1))")
                .HasColumnType("decimal(3, 1)")
                .HasColumnName("FACTOR");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("NAME");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
        });

        modelBuilder.Entity<SeatType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__SEAT_TYP__3214EC27C1D6D073");

            entity.ToTable("SEAT_TYPE");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Factor).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("NAME");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
        });

        modelBuilder.Entity<Theatre>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__THEATRE__3214EC27F2D1CCD7");

            entity.ToTable("THEATRE");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.City)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CreatedById).HasColumnName("CreatedByID");
            entity.Property(e => e.MinTicketPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Street)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UpdateById).HasColumnName("UpdateByID");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.CreatedBy).WithMany(p => p.TheatreCreatedBies)
                .HasForeignKey(d => d.CreatedById)
                .HasConstraintName("FK__THEATRE__Created__412EB0B6");

            entity.HasOne(d => d.UpdateBy).WithMany(p => p.TheatreUpdateBies)
                .HasForeignKey(d => d.UpdateById)
                .HasConstraintName("FK__THEATRE__UpdateB__4222D4EF");
        });

        modelBuilder.Entity<TheatreFacility>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__THEATRE __3214EC279DCA9D5C");

            entity.ToTable("THEATRE FACILITY");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.TheatureId).HasColumnName("TheatureID");

            entity.HasOne(d => d.Facility).WithMany(p => p.TheatreFacilities)
                .HasForeignKey(d => d.FacilityId)
                .HasConstraintName("FK__THEATRE F__Facil__47DBAE45");

            entity.HasOne(d => d.Theature).WithMany(p => p.TheatreFacilities)
                .HasForeignKey(d => d.TheatureId)
                .HasConstraintName("FK__THEATRE F__Theat__46E78A0C");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__USER__1788CCACE6EC9609");

            entity.ToTable("USER");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.CreateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Dob)
                .HasColumnType("date")
                .HasColumnName("DOB");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LastOtp)
                .HasMaxLength(6)
                .IsUnicode(false)
                .HasColumnName("LastOTP");
            entity.Property(e => e.PhoneNo)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.UpdateDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK__USER__RoleID__7A672E12");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
