using Newtonsoft.Json;
using System;
using System.Net;
using WeatherApplication;

namespace WeatherApplication
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = "http://api.openweathermap.org/data/2.5/forecast?q=London,us&appid=d245edc4e26cff82f6afaae9cce85db8";
            var weather = new WebClient().DownloadString(url);
            var obj = JsonConvert.DeserializeObject<MainMessage>(weather);
        }
    }
}