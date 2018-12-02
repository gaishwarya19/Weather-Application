<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather2.aspx.cs" Inherits="WeatherApplication.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Weather Report</title>
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/web.css" />
    <link rel="stylesheet" href="assets/css/mobile.css" media="screen and (max-device-width: 480px)" />
    <link rel="stylesheet" href="assets/css/print.css" media="print" />
    <style>
        .decoration {
            background-color: #5DADE2;
            margin-left: -15px;
        }

        input[type="text"] {
            font-size: 0.75rem;
            border: none;
            margin-right: -5px;
            padding: 8px;
        }

        input[type="submit"] {
            font-size: 0.75rem;
            border: none;
            background-color: #a9a9a9;
            color: #fff;
            text-transform: uppercase;
            padding: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">


            <div class="col col-lg-7">
                <div class="decoration">
                    <div class="row">
                        <div class="col-sm-8">.col-sm-6</div>
                        <div class="col-sm-4">
                            <input type="text" placeholder="Enter City...">
                            <input type="submit" placeholder="Go" value="Go">
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-2">.col-sm-2</div>
                        <div class="col-sm-4">.col-sm-4</div>
                        <div class="col-sm-3">.col-sm-6</div>
                        <div class="col-sm-3">.col-sm-6</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        One of seven columns
                    </div>
                    <div class="col-sm-3">
                        One of seven columns
                    </div>
                    <div class="col-sm-3">
                        One of seven columns
                    </div>
                    <div class="col-sm-3">
                        One of seven columns
                    </div>
                </div>
                <div class="col col-lg-5">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
