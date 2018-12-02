using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Xml;
using System.Net;
using Newtonsoft.Json;

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
        public string txtCity;
        public string desc;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["city"].ToString()))
            {
                throw new Exception("Please enter some value");
            }
            //txtCity = Request.QueryString["city"].Replace(" ", String.Empty);
            txtCity = Request.QueryString["city"].Replace(" ", "+");
            try
            {
                //api call for city description
                //using Google knowlege search API to get the data
                //https://developers.google.com/apis-explorer/#p/kgsearch/v1/kgsearch.entities.search
                HttpWebRequest weatherapirequest = WebRequest.Create("https://kgsearch.googleapis.com/v1/entities:search?query=" +
                txtCity + "&key=AIzaSyAFPNyNsAnAGN2rnS9iWHPjJWUWiPhSgRM&limit=1&types=Place&fields=itemListElement") as HttpWebRequest;
                string response;
                XmlDocument weatherxmlDocument = new XmlDocument();
                using (HttpWebResponse webResponse = weatherapirequest.GetResponse() as HttpWebResponse)
                {
                    StreamReader streamReader = new StreamReader(webResponse.GetResponseStream());
                    response = streamReader.ReadToEnd();
                    //xmlDocument.LoadXml(response);
                    weatherxmlDocument = JsonConvert.DeserializeXmlNode(response);
                    XmlNode xmlNode = weatherxmlDocument.SelectSingleNode("//result/detailedDescription/articleBody");

                    // desc = xmlNode.Attributes["articleBody"].ToString();
                    desc = xmlNode.InnerXml.ToString();
                }

                //api call for weather data
                //using Open Weather API to get the data
                //https://openweathermap.org/current
                System.Net.HttpWebRequest apirequest = WebRequest.Create("http://api.openweathermap.org/data/2.5/weather?q=" +
                   txtCity + "&mode=xml&units=metric&appid=d245edc4e26cff82f6afaae9cce85db8") as HttpWebRequest;
                XmlDocument xmlDocument = new XmlDocument();
                string URL = "http://api.openweathermap.org/data/2.5/weather?q=" +
                    txtCity + "&appid=d245edc4e26cff82f6afaae9cce85db8";

                //string response;
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
                else if (weather.Contains("rain") ||
                            weather.Contains("drizzle") ||
                            weather.Contains("cloud") ||
                            weather.Contains("mist"))
                {
                    BodyTag.Attributes.Add("class", "rainy");
                    Image = "/assets/images/home/rain.png";
                }
                else
                {
                    BodyTag.Attributes.Add("class", "sunny");
                    Image = "/assets/images/home/sun.png";
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                if(ex.Message.Contains("404"))
                {
                    Response.Clear();
                    Response.Write("Hey, We're Sorry. We are unable to get weather details for the city you have provided. Please click here to go back to <a href=\"/Index.aspx\">Home</a>");
                    Response.End();
                }
            }
        }
    }
}