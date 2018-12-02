<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather2.aspx.cs" Inherits="WeatherApplication.WebForm3" %>

<html>

<head>
    <title>Weather Details</title>
    <link href="https://fonts.googleapis.com/css?family=Bungee" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" />  
    
    <style>
        .col-centered {
            float: none;
            margin-right: auto;
            margin-left: auto;
            margin-top: 10%;
        }

        .top-container {
            background-color: #004980;
        }

        .bottom-container {
            margin-top: 5%;
            flex-wrap: nowrap;
        }

        input[type="text"] {
            font-size: 0.75rem;
            border: none;
            margin-right: -5px;
            padding: 8px;
            margin-top: 15px;
            border-radius: 3px;
        }

        input[type="submit"] {
            font-size: 0.75rem;
            background-color: #a9a9a9;
            border-radius: 3px;
            color: #fff;
            font-weight: bold;
            padding: 8px;
            margin: 0px 0px 0px 10px;
        }

        .verticalLine1 {
            border-left: 1px solid lightgray;
            height: 200px;
            position: absolute;
            left: 50%;
            margin-left: -165px;
        }

        .verticalLine2 {
            border-left: 1px solid lightgray;
            height: 200px;
            position: absolute;
            left: 50%;
            margin-left: 10px;
        }

        .verticalLine3 {
            border-left: 1px solid lightgray;
            height: 200px;
            position: absolute;
            left: 50%;
            margin-left: 165px;
        }

        h1 {
            font-family: 'Bungee', cursive;
            color: white;
            font-size: 22px;
            padding-left: 15px;
            padding-top: 5px;
        }

        h2 {
            font-family: 'Bungee', cursive;
            color: white;
            font-size: 22px;
            padding-left: 15px;
        }
        .navbar{
            padding-left: 80px;
            height: 50px;
            color: #9d9d9d;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        .nav-item{
            padding-left: 15px;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="/Index.aspx">Weather Application</a>
      <button class="navbar-toggler" type="button" data-togglek="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="/Index.aspx">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/Weather2.aspx">Future Prediction</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </nav>  
    
    <div class="container">
        <div class="row">
            <div class="col col-lg-7">
                <div class="top-container">
                    <div class="row">
                        <div class="col-sm-6">
                            <h1>Weather</h1>
                            <% if (cityValue != null)
                                             { %><h2><%=cityValue %></h2>
                            <% } %>
                        </div>
                        <div class="col-sm-6" >
                            <form runat="server">
                                <asp:TextBox ID="txtCity" runat="server" style="font-size: 20px;"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_click" />                 
                            </form>
                        </div>        
                    </div>
                    <div class="row">
                        <div class="col-sm-2" >.col-sm-2</div>
                        <div class="col-sm-4" >.col-sm-4</div>
                        <div class="col-sm-3" >.col-sm-6</div>
                        <div class="col-sm-3" >.col-sm-6</div>
                    </div>
                </div>
                <div class="bottom-container">
                    <div class="row">
                        <div class="col-sm" >
                            <p><%=(string.IsNullOrEmpty(day1.dt_txt) ? "": day1.dt_txt)%></p>
                            <p><%=(day1.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image1 %>"</p>
                            <p><%=day1.main.temp - 273 %></p>
                            <p><%=day1.main.humidity %></p>
                        </div>
                        <div class="verticalLine1"></div>
                        <div class="col-sm" >
                            <p><%=(string.IsNullOrEmpty(day2.dt_txt) ? "": day2.dt_txt)%></p>
                            <p><%=(day2.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image2 %>"</p>
                            <p><%=day2.main.temp - 273 %></p>
                            <p><%=day2.main.humidity %></p>
                        </div>
                         <div class="verticalLine2"></div>
                        <div class="col-sm" >
                            <p><%=(string.IsNullOrEmpty(day3.dt_txt) ? "": day3.dt_txt)%></p>
                            <p><%=(day3.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image3 %>"</p>
                            <p><%=day3.main.temp - 273 %></p>
                            <p><%=day3.main.humidity %></p>
                        </div>
                         <div class="verticalLine3"></div>
                        <div class="col-sm" >
                            <p><%=(string.IsNullOrEmpty(day4.dt_txt) ? "": day4.dt_txt)%></p>
                            <p><%=(day4.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image4 %>"</p>
                            <p><%=day4.main.temp - 273 %></p>
                            <p><%=day4.main.humidity %></p>
                        </div>
                </div>
             </div>
            </div>
             <div class="col col-lg-5">
                 <h3> City News</h3>
             </div>
        </div>
   </div>
</div>

</body>

</html>