﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeatherApplication
{
    public class City
    {
        public int id { get; set; }
        public string name { get; set; }
        public Coord coord { get; set; }
        public string country { get; set; }
    }
}