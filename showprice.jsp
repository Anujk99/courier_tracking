<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
  <style>
      .select-css {
    display: block;
    font-size: 16px;
    font-family: sans-serif;
    font-weight: 700;
    color: #444;
    line-height: 1.3;
    padding: .6em 1.4em .5em .8em;
    width: 100%;
    max-width: 100%; 
    box-sizing: border-box;
    margin: 0;
    border: 1px solid #aaa;
    box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
    border-radius: .5em;
    -moz-appearance: none;
    -webkit-appearance: none;
    appearance: none;
    background-color: #fff;
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
      linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
    background-repeat: no-repeat, repeat;
    background-position: right .7em top 50%, 0 0;
    background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
    display: none;
}
.select-css:hover {
    border-color: #888;
}
.select-css:focus {
    border-color: #aaa;
    box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
    box-shadow: 0 0 0 3px -moz-mac-focusring;
    color: #222; 
    outline: none;
}
.select-css option {
    font-weight:normal;
}
body {
	font-family: Arial, Helvetica, sans-serif;
	background: url('https://answers.unity.com/storage/attachments/135164-fade.png');
	background-size: cover;
	color: #fff;
}

.signin {
	text-align: center;
	/* font-size: 30px; */
	background: rgba(44, 62, 80, 0.7);
	margin-left: 180px;
	font-weight: bold;
	width: 250px;
	padding: 40px;
	margin: auto;
	margin-top: 80px;
	height: 300px;
}

form {
	text-align: center;
	width: 240px;
}

input[type=select] {
	width: 240px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=date] {
	width: 240px;
	right-margin:-5px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=date] {
	width: 240px;
	right-margin:-5px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=submit] {
	width: 190px;
	border: none;
	background: white;
	color: #000;
	font-size: 16px;
	line-height: 25px;
	padding: 10px 0;
	border-radius: 20px;
	cursor: pointer;
	font-weight: bold;
}

input[type=submit]:hover {
	color: #fff;
	background-color: #000;
	font-weight: bold;
}

h1 {
	color: #fff;
}

a {
	font-size: 13px;
	color: skyblue;
}

a:hover {
	color: blueviolet;
}

.container {
	display: flex;
	flex-direction: row;
	width: 100px;
	/* font-size: 15px; */
}

::placeholder {
	color: aliceblue;
	opacity: 0.8px;
}
.button {
  background-color: paleturquoise; /* Green */
 
  border: windowframe;
  color: red;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
}
.button1 {
	border-radius: 8px;
}
</style>
</head>

<body id="c2">


<div id="header"></div>
    <div class="signin">
        
                <h1>Parsel details</h1>
                <p id="p1"></p>
                  
<%
    String f=request.getParameter("from");
    String t=request.getParameter("to");
    try {
	boolean st = false;
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:G:/Courier/vote.db");
                      PreparedStatement st1= conn.prepareStatement("select charge from cdata where from1=? and to1=?");
                      st1.setString(1, f);
                      st1.setString(2, t);
                     ResultSet rs= st1.executeQuery();
                      rs.next();%>
                      
                      <h2>From : <%=f%></h2> <br><br>
                       <h2>To :  <%=t%></h2> <br><br>
                       <h2>Charges : <%=rs.getInt(1)%></h2> <br><br>


<% conn.close();%>
<%}catch (Exception e) {
	System.out.println(e);
}
%>
 
<br><br>

                    <br><br>
                    <a href="booknow.jsp?f=<%=f%>&&t=<%=t%>"><button class="button button1">
				<h3>Book Now</h3>
			</button></a>
                <div id="container">
                  
                  
               </div><br><br>

        
    </div>
    
</body>
</html>