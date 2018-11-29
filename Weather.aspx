<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather.aspx.cs" Inherits="WeatherApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/web.css" />
    <link rel="stylesheet" href="assets/css/mobile.css" media="screen and (max-device-width: 480px)" />
    <link rel="stylesheet" href="assets/css/print.css" media="print" />
</head>
<body runat="server" id="BodyTag">
<div class="temp">  
<h1> <%=weather%></h1>
<table id="tabledesign">
    <tr>
    <td style="font-family: 'Patua One', cursive; font-size: 30px;">London</td> 
        <td> <img src="%=Image%"/></td>
  </tr>
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
</body>
</html>
