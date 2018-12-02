using Newtonsoft.Json;
using System;
using System.Net;
using WeatherApplication;

namespace WeatherApplication
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public string cityValue;
        protected void Page_Load(object sender, EventArgs e)
        {

            var url = "http://api.openweathermap.org/data/2.5/forecast?q=London,us&appid=d245edc4e26cff82f6afaae9cce85db8";
            var weather = new WebClient().DownloadString(url);
            var obj = JsonConvert.DeserializeObject<MainMessage>(weather);
            var url2 = "https://newsapi.org/v2/everything?q=" + cityValue + "&from=2018-12-01&sources=bbc-news&sortBy=popularity&apiKey=e1b6533a443c46e5835101936851de83";
            var newsjson = new WebClient().DownloadString(url);
            var obj2 = JsonConvert.DeserializeObject<Newsfeed>(newsjson);
        }
    }
}