using API.Code;
using API.Code.Interfaces;
using API.Extensions;
using API.Models;
using API.Services;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;

namespace API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            //builder.Services.ConfigureCors(builder.Configuration);
            builder.Services.AddAuthentication(builder);
            builder.Services.AddControllers();
            builder.Services.AddControllers().AddJsonOptions(x =>
                x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddScoped<EmailService, EmailService>();
            builder.Services.AddScoped<S3Upload, S3Upload>();
            builder.Services.AddScoped<Password, Password>();
            builder.Services.AddScoped<IUser, RUser>();
            builder.Services.AddScoped<IRole, RRole>();
            builder.Services.AddScoped<IMovie, RMovie>();
            builder.Services.AddScoped<ICast, RCast>();
            builder.Services.AddScoped<IMovieRole, RMovieRole>();
            builder.Services.AddScoped<IMovieObject, RMovieObject>();
            builder.Services.AddScoped<IMovieCast, RMovieCast>();
            builder.Services.AddScoped<IObjectName, RObjectName>();
            builder.Services.AddScoped<ITheatre, RTheatre>();
            builder.Services.AddScoped<IFacility, RFacility>();
            builder.Services.AddScoped<IScreen, RScreen>();
            builder.Services.AddScoped<IScreenType, RScreenType>();
            builder.Services.AddScoped<ISeatType, RSeatType>();
            builder.Services.AddScoped<ILayout, RLayout>();
            builder.Services.AddScoped<ITheatreFacility, RTheatreFacility>();
            builder.Services.AddScoped<IMovieAccess, RMovieAccess>();
            builder.Services.AddScoped<Token, Token>();
            builder.Services.AddDbContext<BookMyShowContext>();
            builder.Services.ConfigureCors(builder.Configuration);
            var app = builder.Build();
            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseForwardedHeaders(new ForwardedHeadersOptions
            {
                ForwardedHeaders = ForwardedHeaders.All
            });

            app.UseCors("CorsPolicy");

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}


//Scaffold-DbContext "Server=PC0751\MSSQL2019;Database=BookMyShow;Trusted_Connection=True;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models