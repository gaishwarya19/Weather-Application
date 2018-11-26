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
            BodyTag.Attributes.Add("class", "home");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var city = TextBox1.Text.ToString();
            var url = string.Format("{0}?city={1}", @"Weather.aspx", city).ToString();
            Response.Redirect(url);
        }
    }
}