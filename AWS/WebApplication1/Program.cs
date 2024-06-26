using Amazon.DynamoDBv2;
using Amazon.SQS;
using Microsoft.AspNetCore;
using WebApplication1.Services;

namespace WebApplication1
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args)
        {
            return WebHost.CreateDefaultBuilder(args).ConfigureLogging
                (
                    logging =>
                    {
                        logging.AddAWSProvider();
                        logging.SetMinimumLevel(LogLevel.Information);
                    }
                ).UseStartup<Startup>();
        }

    }
}


/**********************
 * 
 * 
            ////
            //var builder = WebApplication.CreateBuilder(args);

            //// Add services to the container.
            //builder.Services.AddControllersWithViews();

            //builder.Services.AddTransient<IContactQueueService, ContactQueueService>();

            //builder.Services.AddDefaultAWSOptions(builder.Configuration.GetAWSOptions());
            //builder.Services.AddAWSService<IAmazonDynamoDB>();
            //builder.Services.AddAWSService<IAmazonSQS>();


            //var app = builder.Build();

            //// Configure the HTTP request pipeline.
            //if (!app.Environment.IsDevelopment())
            //{
            //    app.UseExceptionHandler("/Home/Error");
            //    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            //    app.UseHsts();
            //}

            //app.UseHttpsRedirection();
            //app.UseStaticFiles();

            //app.UseRouting();

            //app.UseAuthorization();

            //app.MapControllerRoute(
            //    name: "default",
            //    pattern: "{controller=Home}/{action=Index}/{id?}");

            //app.Run();

***********/