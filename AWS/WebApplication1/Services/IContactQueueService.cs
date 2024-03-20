using WebApplication1.Models;

namespace WebApplication1.Services
{
    public interface IContactQueueService
    {
        Task<bool> AddAsync(ContactFormModel contactForm, string sendMailQueueUrl);
    }
}
