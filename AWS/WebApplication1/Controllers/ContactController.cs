using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.AccessControl;
using WebApplication1.Models;
using WebApplication1.Services;

namespace WebApplication1.Controllers
{
    public class ContactController : Controller
    {
        private IConfiguration _configuration;
        private readonly ILogger _logger;
        private IContactQueueService _ContactQueueService;

        public ContactController(IConfiguration configuration, ILogger<ContactController> logger, IContactQueueService ContactQueueService)
        {
            _configuration = configuration;
            _logger = logger;
            _ContactQueueService = ContactQueueService;
        }

        [HttpGet]
        public IActionResult Index(string message)
        {
            ViewBag.Message = message;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index([Bind("Name,Email,Phone,Comments")] ContactFormModel model)
        {
            model.IP = Common.ResolveIPAddress(HttpContext);

            await _ContactQueueService.AddAsync(model, _configuration["SendMailQueueUrl"]);

            return RedirectToAction("Index", new { message = "Message has been added to AWS SQS!" });
        }

        //[HttpPost]
        //public async Task<IActionResult> PostAsync([Bind("Name,Email,Phone,Comments")] ContactFormModel model)
        //{
        //    model.IP = Common.ResolveIPAddress(HttpContext);

        //    await _ContactQueueService.AddAsync(model, _configuration["SendMailQueueUrl"]);

        //    return RedirectToAction("Index");
        //}
    }
}
