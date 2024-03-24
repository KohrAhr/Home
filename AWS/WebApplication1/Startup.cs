using Amazon.DynamoDBv2;
using Amazon.SQS;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;


namespace WebApplication1
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            // Configure services here
            services.AddControllersWithViews();

            services.AddDefaultAWSOptions(Configuration.GetAWSOptions());
            services.AddAWSService<IAmazonDynamoDB>();
            services.AddAWSService<IAmazonSQS>();

            services.AddTransient<IContactQueueService, ContactQueueService>();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            var logger = loggerFactory.CreateLogger<Program>();
            logger.LogInformation($"New instanct started");

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // Use error handling middleware appropriate for production
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }







    //public class Startup
    //{
    //    private readonly string _applicationName;

    //    public IConfiguration Configuration { get; }

    //    //public void Configure(IApplicationBuilder app)
    //    //{
    //    //    // Allow requests only from these IP addresses
    //    //    //var allowedIpAddresses = new[] { "192.168.1.100", "10.0.0.1" };

    //    //    //app.UseMiddleware<IpFilterMiddleware>(allowedIpAddresses);

    //    //    // Add other middleware and configure routes
    //    //}

    //    public Startup(IHostingEnvironment env)
    //    {
    //        var builder = Host.CreateDefaultBuilder(null)
    //            .ConfigureAppConfiguration((hostingContext, config) =>
    //            {
    //                var env = hostingContext.HostingEnvironment;
    //                config.SetBasePath(env.ContentRootPath)
    //                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
    //                    .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true, reloadOnChange: true)
    //                    .AddEnvironmentVariables();
    //            });
    //            //}); var build = new ConfigurationBinder().SetBasePath(env.ContentRootPath)
    //            //.AddJsonFile("appsettings.json", true, true)
    //            //.AddJsonFile($"appsettings.{env.EnvironmentVariable}.json", true, true)
    //            //.AddEnvironmentVariables();

    //        Configuration = builder.Build();

    //        _applicationName = Configuration["ApplicationName"];
    //    }

    //    public void ConfigureServices(IServiceCollection services)
    //    {
    //        services.AddControllersWithViews();

    //        services.AddDefaultAWSOptions(Configuration.GetAWSOptions());
    //        services.AddAWSService<IAmazonDynamoDB>();
    //        services.AddAWSService<IAmazonSQS>();

    //        services.AddTransient<IContactQueueService, ContactQueueService>();

    //    }

    //    public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
    //    {
    //        //var logger = loggerFactory.CreateLogger<Program>();
    //        //logger.LogInformation($"New instanct started");
    //    }

    //}
}
