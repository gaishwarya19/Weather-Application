﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeatherApplication
{
    public class Newsfeed
    {
        public string status { get; set; }
        public int totalResults { get; set; }
        public List<Article> articles { get; set; }
    }
}