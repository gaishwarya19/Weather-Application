using Newtonsoft.Json;
using System;
using System.Net;
using WeatherApplication;

namespace WeatherApplication
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public string cityValue;
        public MainMessage cityWeather;
        
        public Newsfeed cityNews;
        public List day1;
        public string Image1;
        public List day2;
        public string Image2;
        public List day3;
        public string Image3;
        public List day4;
        public string Image4;
        public int count = 0;
        public string city;
        public Boolean load;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!load)
            {
                count = 0;
                var url = "http://api.openweathermap.org/data/2.5/forecast?q=Cincinnati,us&appid=d245edc4e26cff82f6afaae9cce85db8";
                var weather = new WebClient().DownloadString(url);
                cityWeather = JsonConvert.DeserializeObject<MainMessage>(weather);
                city = cityWeather.city.name;
                foreach (var l in cityWeather.list)
                {
                    if (l.dt_txt.Contains("12:00:00"))
                    {
                        switch (count)
                        {
                            case 0:
                                day1 = l;
                                break;
                            case 1:
                                day2 = l;
                                break;
                            case 2:
                                day3 = l;
                                break;
                            case 3:
                                day4 = l;
                                break;
                        }
                        count = count + 1;
                    }
                }
                if (day1.weather[0].description.Contains("snow"))
                {
                    Image1 = "/assets/images/home/snowflake.png";
                }
                else if (day1.weather[0].description.Contains("rain") ||
                            day1.weather[0].description.Contains("drizzle") ||
                            day1.weather[0].description.Contains("cloud") ||
                            day1.weather[0].description.Contains("mist"))
                {
                    Image1 = "/assets/images/home/rain.png";
                }
                else
                {
                    Image1 = "/assets/images/home/sun.png";
                }

                if (day2.weather[0].description.Contains("snow"))
                {
                    Image2 = "/assets/images/home/snowflake.png";
                }
                else if (day2.weather[0].description.Contains("rain") ||
                            day2.weather[0].description.Contains("drizzle") ||
                            day2.weather[0].description.Contains("cloud") ||
                            day2.weather[0].description.Contains("mist"))
                {
                    Image2 = "/assets/images/home/rain.png";
                }
                else
                {
                    Image2 = "/assets/images/home/sun.png";
                }

                if (day3.weather[0].description.Contains("snow"))
                {
                    Image3 = "/assets/images/home/snowflake.png";
                }
                else if (day3.weather[0].description.Contains("rain") ||
                            day3.weather[0].description.Contains("drizzle") ||
                            day3.weather[0].description.Contains("cloud") ||
                            day3.weather[0].description.Contains("mist"))
                {
                    Image3 = "/assets/images/home/rain.png";
                }
                else
                {
                    Image3 = "/assets/images/home/sun.png";
                }

                if (day4.weather[0].description.Contains("snow"))
                {
                    Image4 = "/assets/images/home/snowflake.png";
                }
                else if (day4.weather[0].description.Contains("rain") ||
                            day4.weather[0].description.Contains("drizzle") ||
                            day4.weather[0].description.Contains("cloud") ||
                            day4.weather[0].description.Contains("mist"))
                {
                    Image4 = "/assets/images/home/rain.png";
                }
                else
                {
                    Image4 = "/assets/images/home/sun.png";
                }

                var url2 = "https://newsapi.org/v2/everything?q=" + "Cincinnati" + "&from=2018-12-01&sources=bbc-news&sortBy=popularity&apiKey=e1b6533a443c46e5835101936851de83";
                var newsjson = new WebClient().DownloadString(url);
                cityNews = JsonConvert.DeserializeObject<Newsfeed>(newsjson);
            }
        }
        protected void btnSearch_click(object sender, EventArgs e)
        {
            count = 0;
            cityValue = txtCity.Text.ToString();
            var url = "http://api.openweathermap.org/data/2.5/forecast?q="+ cityValue +"&appid=d245edc4e26cff82f6afaae9cce85db8";
            var weather = new WebClient().DownloadString(url);
            var cityWeather = JsonConvert.DeserializeObject<MainMessage>(weather);
            city = cityWeather.city.name;
            foreach ( var l in cityWeather.list )
            {
                if (l.dt_txt.Contains("12:00:00")){
                    switch (count)
                    {
                        case 0:
                            day1 = l;
                            break;
                        case 1:
                            day2 = l;
                            break;
                        case 2:
                            day3 = l;
                            break;
                        case 3:
                            day4 = l;
                            break;
                    }
                    count = count + 1;
                }
            }
            var url2 = "https://newsapi.org/v2/everything?q=" + cityValue + "&from=2018-12-01&sources=bbc-news&sortBy=popularity&apiKey=e1b6533a443c46e5835101936851de83";
            var newsjson = new WebClient().DownloadString(url);
            var obj2 = JsonConvert.DeserializeObject<Newsfeed>(newsjson);
            if (day1.weather[0].description.Contains("snow"))
            {
                Image1 = "/assets/images/home/snowflake.png";
            }
            else if (day1.weather[0].description.Contains("rain") ||
                        day1.weather[0].description.Contains("drizzle") ||
                        day1.weather[0].description.Contains("cloud") ||
                        day1.weather[0].description.Contains("mist"))
            {
                Image1 = "/assets/images/home/rain.png";
            }
            else
            {
                Image1 = "/assets/images/home/sun.png";
            }

            if (day2.weather[0].description.Contains("snow"))
            {
                Image2 = "/assets/images/home/snowflake.png";
            }
            else if (day2.weather[0].description.Contains("rain") ||
                        day2.weather[0].description.Contains("drizzle") ||
                        day2.weather[0].description.Contains("cloud") ||
                        day2.weather[0].description.Contains("mist"))
            {
                Image2 = "/assets/images/home/rain.png";
            }
            else
            {
                Image2 = "/assets/images/home/sun.png";
            }

            if (day3.weather[0].description.Contains("snow"))
            {
                Image3 = "/assets/images/home/snowflake.png";
            }
            else if (day3.weather[0].description.Contains("rain") ||
                        day3.weather[0].description.Contains("drizzle") ||
                        day3.weather[0].description.Contains("cloud") ||
                        day3.weather[0].description.Contains("mist"))
            {
                Image3 = "/assets/images/home/rain.png";
            }
            else
            {
                Image3 = "/assets/images/home/sun.png";
            }

            if (day4.weather[0].description.Contains("snow"))
            {
                Image4 = "/assets/images/home/snowflake.png";
            }
            else if (day4.weather[0].description.Contains("rain") ||
                        day4.weather[0].description.Contains("drizzle") ||
                        day4.weather[0].description.Contains("cloud") ||
                        day4.weather[0].description.Contains("mist"))
            {
                Image4 = "/assets/images/home/rain.png";
            }
            else
            {
                Image4 = "/assets/images/home/sun.png";
            }
            load = true;
        }
    }
}