using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Xml;
namespace WeatherApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string Image;
        public string minTemp;
        public string maxTemp;
        public string temparatureValue;
        public string weather;
        public string humidity;

        protected void Page_Load(object sender, EventArgs e)
        {
            string txtCity = Request.QueryString["city"];
            System.Net.HttpWebRequest apirequest = WebRequest.Create("http://api.openweathermap.org/data/2.5/weather?q=" +
               txtCity + "&mode=xml&units=metric&appid=d245edc4e26cff82f6afaae9cce85db8") as HttpWebRequest;
            XmlDocument xmlDocument = new XmlDocument();
            string URL = "http://api.openweathermap.org/data/2.5/weather?q=" +
                txtCity + "&appid=d245edc4e26cff82f6afaae9cce85db8";

            string response;
            using (HttpWebResponse webResponse = apirequest.GetResponse() as HttpWebResponse)
            {
                StreamReader streamReader = new StreamReader(webResponse.GetResponseStream());
                response = streamReader.ReadToEnd();
                xmlDocument.LoadXml(response);
            }
            XmlNode temparatureNode = xmlDocument.SelectSingleNode("//temperature");
            XmlAttribute temparature = temparatureNode.Attributes["value"];
            temparatureValue = temparature.Value;

            minTemp = temparatureNode.Attributes["min"].Value.ToString();
            maxTemp = temparatureNode.Attributes["max"].Value.ToString();
            humidity = xmlDocument.SelectSingleNode("//humidity").Attributes["value"].Value.ToString();
            weather = xmlDocument.SelectSingleNode("//weather").Attributes["value"].Value.ToString();
            if (weather.Contains("snow"))
            {
                BodyTag.Attributes.Add("class", "snow");
                Image = "/assets/images/home/snowflake.png";
            }
            else if (weather.Contains("sun") || (weather.Contains("sky")))
            {
                BodyTag.Attributes.Add("class", "sunny");
                Image = "/assets/images/home/sun.png";
            }
            else if (weather.Contains("rain") || (weather.Contains("drizzle")) || weather.Contains("cloud"))
            {
                BodyTag.Attributes.Add("class", "rainy");
                Image = "/assets/images/home/rain.png";
            }
        }
    }
}