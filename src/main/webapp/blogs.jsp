<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <title>Retrieve data from database in JSP</title>
    <link rel="stylesheet" href="css/index2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
   
</head>
<body Style="background-color: green;">
<nav>
<div class="logo">
            BlogSite
         </div>
         <input type="checkbox" id="click">
         <label for="click" class="menu-btn">
         <i class="fas fa-bars"></i>
         </label>
         <ul>
            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="create.jsp">Create Blog</a></li>
            
            <li><a href="about.jsp">About us</a></li>
            <li>
                <form method="post" action="blogs.jsp" class="form-inline my-2 my-lg-0">
    <div class="input-group">
        <input class="form-control" type="search" placeholder="Search" aria-label="Search" name="search" Style="border-radius:20px;">
        <button class="btn btn-outline-success" type="submit" Style="border-radius:20px;">
            <i class="fas fa-search"></i>
        </button>
    </div>
</form>

            </li>
         </ul>
         

      </nav>
      
     <form action="blogs.jsp" method="post">
    <select name="myDropdown">
        <option value="option1">recent upload</option>
        <option value="option2">past upload</option>
      
    </select>
    <input type="submit" value="Submit">
</form>
     

    
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "Abhiram@123");
            statement = connection.createStatement();
            String searchInput = request.getParameter("search");
            String sql = "SELECT * FROM image";

            boolean foundResults = false;
            String sortOption = request.getParameter("myDropdown");
            
            if (sortOption != null && sortOption.equals("option1")) {
                sql = "SELECT * FROM image ORDER BY id DESC";
            }  else if (sortOption != null && sortOption.equals("option2")) {
                sql = "SELECT * FROM image ORDER BY id ASC";
            }
            if(searchInput!=null)
            {
                if (sortOption != null && sortOption.equals("option1")) {
                	sql="SELECT * FROM image where topic='"+searchInput+"' ORDER BY id DESC";
                } 
                else
                {
                	sql="SELECT * FROM image where topic='"+searchInput+"' ORDER BY id ASC";
                }
            	
            	 
            }
            
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String topic = resultSet.getString("topic");
                String textarea = resultSet.getString("textarea");
                byte[] imageBytes = resultSet.getBytes("image");
               
                // Convert image bytes to Base64 string
                foundResults=true;
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        %>
        
  <div class="container" style="background-color: red; margin: 50px auto; padding: 20px; border-radius:1rem;">
  <div class="section">
    <h1 class="heading" style="text-align: center;"><%= topic %></h1>
    <p class="text"><%= textarea %></p>
      

    <% if (base64Image != null && !base64Image.isEmpty()) { %>
      <div style="display: flex; justify-content: center;">
        <img src="data:image/png;base64,<%= base64Image %>" alt="Image" width="300rem">
      </div>
    <% } %>
  </div>
</div>

    <%
    
        }
            if (!foundResults) {
                // Display message when no results were found
                %>
                <div class="container" style="text-align: center; margin-top: 50px;">
                    <h2>No topics available</h2>
                </div>
                <%
            }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    
    <div class="container">
    <a href="blogs.jsp">
    <button class="center-button">All blogs</button>
    </a>
  </div>

</body>