<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WeatherApplication.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/web.css" />
    <link rel="stylesheet" href="assets/css/mobile.css" media="screen and (max-device-width: 480px)" />
    <link rel="stylesheet" href="assets/css/print.css" media="print" />
    <link href="https://fonts.googleapis.com/css?family=Slackey" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Shojumaru" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Chelsea+Market" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
         $(function () {
             $("#txtCity").autocomplete({
                 source: "CityAutocompletion.aspx"
             });
         });
    </script>
</head>
<body runat="server" id="BodyTag">
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
    <br />
    <div class="container">

        <div class="row">
            <h1>Weather Forecast</h1>
            <img src="/assets/images/home/cloud.png" class="center">
            <div class="formstyle">
                <form runat="server">
                    <label for="city" style="font-size: 25px; font-family: 'Chelsea Market', cursive; color: white">Enter Your City:</label>
                    <asp:TextBox ID="txtCity" runat="server" style="font-size: 20px;"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_click" />
                </form>
            </div>
        </div>
    </div>
   
    <script src="assets/lib/bootstrap/dist/js/bootstrap.js" type="text/javascript"></script>
    <script src="assets/js/site.js" type="text/javascript"></script>
</body>
</html>

