<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather2.aspx.cs" Inherits="WeatherApplication.WebForm3" %>

<html>

<head>
    <title>Weather Details</title>
    <link href="https://fonts.googleapis.com/css?family=Bungee" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <link rel="stylesheet" href="assets/lib/bootstrap/dist/css/bootstrap.css" /> 
        <link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Sigmar+One" rel="stylesheet">
    
    <style>
        .col-centered {
            float: none;
            margin-right: auto;
            margin-left: auto;
            margin-top: 10%;
        }

        .top-container {
            background-color: mediumblue;
        }

        .bottom-container {
            
            padding-top:1%;
            padding-left:1%;
            flex-wrap: nowrap;
            background-color:#95A5A6;
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
            font-size: 20px;
            background-color: #a9a9a9;
            border-radius: 3px;
            color: #fff;
            font-weight: bold;
            padding: 8px;
            margin: 0px 0px 0px 10px;
        }

        .verticalLine1 {
            border-left: 1px solid black;
            height: 310px;
            position: absolute;
            left: 50%;
            margin-left: -165px;
        }

        .verticalLine2 {
            border-left: 1px solid black;
            height: 310px;
            position: absolute;
            left: 50%;
            margin-left: 1px;
        }

        .verticalLine3 {
            border-left: 1px solid black;
            height: 310px;
            position: absolute;
            left: 50%;
            margin-left: 165px;
        }

        h1 {
           font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: white;
            font-size: 35px;
            padding-left: 15px;
            
        }

        h2 {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: white;
            font-size: 30px;
            padding-left: 15px;
        }
            h3 {
            font-family: 'Fredoka One', cursive;
            color: black;
            font-size: 30px;
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
            p{
                color:white;
                font-size:14px;
            text-align:center;
                font-weight:bold;
              
            }
            #pdate{
                color:white;
                font-size:14px;
            text-align:center;
                font-weight:bold;
               font-size :20px;
            }
            #capitalizestyle{
            text-transform:capitalize;
            color:white;
                font-size:14px;
            text-align:center;
                font-weight:bold;
            font-size :15px;
            }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="/index.aspx">Weather Application</a>
      <button class="navbar-toggler" type="button" data-togglek="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="/index.aspx">Home <!---<span class="sr-only">(current)</span>--></a>
          </li>
          <li class="nav-item">
            <!---<a class="nav-link" href="/Weather2.aspx">Future Prediction</a> shreya-->
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
                                <asp:Button ID="btnSearch" runat="server" placeholder="Enter City" Text="Go" OnClick="btnSearch_click" />                 
                            </form>
                        </div>        
                    </div>
                    <div class="row">
                        <div class="col-sm-2" > </div>
                        <div class="col-sm-4" > </div>
                        <div class="col-sm-3" > </div>
                        <div class="col-sm-3" > </div>
                    </div>
                </div>
                <div class="bottom-container">
                    <div class="row">
                        <div class="col-sm" >
                            <p id="pdate"><%=(string.IsNullOrEmpty(day1.dt_txt) ? "": day1.dt_txt).Substring(5,6)%></p>
                            <p id="capitalizestyle"><%=(day1.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image1 %>"</p>
                                <p>Temperature:</p>
                            <p><%=(((day1.main.temp)*9/5) - 459.67).ToString().Substring(0,2) %></p>
                                 <p>Humidity:</p>
                            <p><%=day1.main.humidity %></p>
                        </div>
                        <div class="verticalLine1"></div>
                        <div class="col-sm" >
                            <p id="pdate"><%=(string.IsNullOrEmpty(day2.dt_txt) ? "": day2.dt_txt).Substring(5,6)%></p>
                            <p id="capitalizestyle"><%=(day2.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image2 %>"</p>
                                <p>Temperature:</p>
                            <p><%=(((day2.main.temp)*9/5) - 459.67).ToString().Substring(0,2)  %></p>
                                 <p>Humidity:</p>
                            <p><%=day2.main.humidity %></p>
                        </div>
                         <div class="verticalLine2"></div>
                        <div class="col-sm" >
                            <p id="pdate"> <%=(string.IsNullOrEmpty(day3.dt_txt) ? "": day3.dt_txt).Substring(5,6)%></p>
                            <p id="capitalizestyle"><%=(day3.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image3 %>"</p>
                                 <p>Temperature:</p>
                            <p><%=(((day3.main.temp)*9/5) - 459.67).ToString().Substring(0,2)  %></p>
                                 <p>Humidity:</p>
                            <p><%=day3.main.humidity %></p>
                        </div>
                         <div class="verticalLine3"></div>
                        <div class="col-sm" >
                            <p id="pdate"><%=(string.IsNullOrEmpty(day4.dt_txt) ? "": day4.dt_txt).Substring(5,6)%></p>
                            <p id="capitalizestyle"><%=(day4.weather[0].description ?? "") %></p>
                            <p><img src="<%=Image4 %>"</p>
                            <p>Temperature:</p>
                            <p><%=(((day4.main.temp)*9/5) - 459.67).ToString().Substring(0,2) %></p>
                            <p>Humidity:</p>
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