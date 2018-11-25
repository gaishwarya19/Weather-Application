using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
protected void Button1_Click(object sender, EventArgs e)
        {
            string city;
            city = TextBox1.Text.ToString();
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
            string temp_string = temp_value.Value;
            
            string mintemp = temp_node.Attributes["min"].Value.ToString();
            string maxtemp = temp_node.Attributes["max"].Value.ToString();
            string weather = xmlDocument.SelectSingleNode("//weather").Attributes["value"].Value.ToString();

            Label1.Text = "Cur temp: " + temp_string + " Min temp: " + mintemp + " max temp: " + maxtemp + " weather: " + weather;
        }
    }
}