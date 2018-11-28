using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeatherApplication
{
    public partial class Autocompletecitynames : System.Web.UI.Page
    {
        List<countryCities> CountryCities;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var webClient = new WebClient())
            {

                String rawData =
                    webClient.DownloadString("https://pkgstore.datahub.io/core/world-cities/world-cities_json/data/5b3dd46ad10990bca47b04b4739a02ba/world-cities_json.json");
                
               CountryCities = JsonConvert.DeserializeObject<List<countryCities>>(rawData);               
            }
            String term = Request.QueryString["term"];

            Response.Clear();
            // change the content type, so the browser knows it's JSON
            Response.ContentType = "application/json; charset=utf-8";

          

            List<String> matchedCities = new List<String>();

            // iterate over these options, and show only ones that contain the user's text.
            foreach (countryCities country in CountryCities)
            {

                if (country.name.Contains(term))
                {
                    matchedCities.Add(country.name);
                }
            }

            // change the list of citys to a JSON stream.
            string cityJson = JsonConvert.SerializeObject(matchedCities);

            // write our stuff!
            Response.Write(cityJson);
            // we're all done!
            Response.End();
        }
    }
}