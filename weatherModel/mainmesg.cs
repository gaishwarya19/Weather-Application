﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeatherApplication
{
    public class MainMessage
    {
        public string cod { get; set; }
        public double message { get; set; }
        public int cnt { get; set; }
        public List<List> list { get; set; }
        public City city { get; set; }
    }
}