using Amazon.SQS;
using Amazon.SQS.Model;
using WebApplication1.Models;
using Newtonsoft.Json;

namespace WebApplication1.Services
{
    public class ContactQueueService : IContactQueueService
    {
        private readonly IAmazonSQS _sqsClient;
        private readonly ILogger _logger;

        public ContactQueueService(ILogger<ContactQueueService> logger, IAmazonSQS sqsClient)
        {
            _logger = logger;
            _sqsClient = sqsClient;
        }

        public async Task<bool> AddAsync(ContactFormModel contactForm, string sendMailQueueUrl)
        {
            var sendRequest = new SendMessageRequest
            {
                QueueUrl = sendMailQueueUrl,
                MessageBody = $"{{ 'ContactForm': {JsonConvert.SerializeObject(contactForm)} }}"
            };

            var response = await _sqsClient.SendMessageAsync(sendRequest);

            return response.HttpStatusCode == System.Net.HttpStatusCode.OK;
        }
    }
}
