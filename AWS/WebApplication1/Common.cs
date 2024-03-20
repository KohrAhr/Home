using Newtonsoft.Json;

namespace WebApplication1
{
    public static class Common
    {
        public static string ResolveIPAddress(HttpContext context)
        {
            return context?.Connection?.RemoteIpAddress?.ToString();
        }

        public static string GetJsonFromException(Exception ex)
        {
            if (ex is null)
            {
                return null;
            }
            else
            { 
                return JsonConvert.SerializeObject(ex);
            }
        }
    }
}
