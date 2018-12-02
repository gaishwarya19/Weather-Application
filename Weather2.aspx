<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weather2.aspx.cs" Inherits="WeatherApplication.WebForm3" %>

<html>

<head>
    <title>Weather Details</title>
    <link href="https://fonts.googleapis.com/css?family=Bungee" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    
    
    <style>
        
        .col-centered {
        float: none;
        margin-right: auto;
        margin-left: auto;
            margin-top: 10%;
        }   

        .top-container{
            
            background-color:#004980;
           
        }
        .bottom-container{
            margin-top: 5%;
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
        h1{
            font-family: 'Bungee', cursive;
            color: white;
            font-size:22px;
            padding-left: 15px;
            padding-top: 5px;
        }
        h2{
            font-family: 'Bungee', cursive;
            color: white;
            font-size:22px;
            padding-left: 15px;
        }
        
    </style>
</head>

<body>
    
    
    <div class="container">
        <div class="row">
  
        
            <div class="col col-lg-7">
                
                <div class="top-container">
                <div class="row">
        <div class="col-sm-6">
            <h1>Weather</h1>
            <h2><%=city %></h2>
        
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
                <div class="col col-lg-5">

                </div>
                </div>
        </div>
    </div>
</body>

</html>