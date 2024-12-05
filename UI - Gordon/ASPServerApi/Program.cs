using System;
using System.Security.Cryptography;

var builder = WebApplication.CreateBuilder(args);

byte[] secretbyte = new byte[64];
using (var random = RandomNumberGenerator.Create())
{
    random.GetBytes(secretbyte);
}

string secretKey = Convert.ToBase64String(secretbyte);

// Add services to the container.builder.Services.AddDbContext<AppDbContext>(x =>
builder.Services.AddDbContext<AppDbContext>(x =>
{
    var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    x.UseSqlServer(connectionString);
});




builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
