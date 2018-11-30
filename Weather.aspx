<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather.aspx.cs" Inherits="WeatherApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=txtCity%> - Weather Report</title>
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/web.css" />
    <link rel="stylesheet" href="assets/css/mobile.css" media="screen and (max-device-width: 480px)" />
    <link rel="stylesheet" href="assets/css/print.css" media="print" />
</head>
<body runat="server" id="BodyTag">
    <!-- Navigation Menu at the header -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">Weather Application</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Weather Details Node -->
    <div class="temp">
        <h1><%=weather%></h1>
        <table id="tabledesign">
            <tr>
                <td style="font-family: 'Patua One', cursive; font-size: 30px;"><%=txtCity%></td>
                <td>
                    <img src="<%=Image%>"></td>
            </tr>
            <br>
            <br>
            <tr>
                <td>Current Temperature</td>
                <td style="text-align: center"><%=temparatureValue%></td>
            </tr>
            <tr>
                <td>Min. Temperature</td>
                <td style="text-align: center"><%=minTemp%></td>
            </tr>
            <tr>
                <td>Max. Temperature</td>
                <td style="text-align: center"><%=maxTemp%></td>
            </tr>
            <tr>
                <td>Humidity</td>
                <td style="text-align: center"><%=humidity%></td>
            </tr>
        </table>
    </div>
    <!-- End of Weather Details Node -->
</body>
</html>
