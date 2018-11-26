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
        public string mintemp;
        public string maxtemp;
        public string temp_string;
        public string weather;
        public string humidity;
        protected void Page_Load(object sender, EventArgs e)
        {
            string city = Request.QueryString["city"];
            System.Net.HttpWebRequest apirequest = WebRequest.Create("http://api.openweathermap.org/data/2.5/weather?q=" +
               city + "&mode=xml&units=metric&appid=d245edc4e26cff82f6afaae9cce85db8") as HttpWebRequest;
            XmlDocument xmlDocument = new XmlDocument();
            string URL = "http://api.openweathermap.org/data/2.5/weather?q=" +
                city + "&appid=d245edc4e26cff82f6afaae9cce85db8";

            string response;
            using (HttpWebResponse webResponse = apirequest.GetResponse() as HttpWebResponse)
            {
                StreamReader streamReader = new StreamReader(webResponse.GetResponseStream());
                response = streamReader.ReadToEnd();
                xmlDocument.LoadXml(response);
            }
            //using (WebClient client = new WebClient())
            //{
            //    response = client.DownloadString(URL);
            //}
            XmlNode temp_node = xmlDocument.SelectSingleNode("//temperature");
            XmlAttribute temp_value = temp_node.Attributes["value"];
            temp_string = temp_value.Value;

            mintemp = temp_node.Attributes["min"].Value.ToString();
            maxtemp = temp_node.Attributes["max"].Value.ToString();
            humidity = xmlDocument.SelectSingleNode("//humidity").Attributes["value"].Value.ToString();
            weather = xmlDocument.SelectSingleNode("//weather").Attributes["value"].Value.ToString();
            BodyTag.Attributes.Add("class", "snow");
            Image = "/assets/images/home/snowflake.png";
        }
    }
}