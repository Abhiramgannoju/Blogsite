<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>craete blog page</title>
<link rel="stylesheet" href="css/index2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/create.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
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
            <li><a href="blogs.jsp">All Blogs</a></li>
            
            <li><a href="about.jsp">About us</a></li>
        
         </ul>
         

      </nav>
 <div class="container" style="max-width: 500px; margin: 0 auto;">
  <form method="post" action="createblog" class="register-form" id="login-form" enctype="multipart/form-data">
    <h2>Enter the Topic</h2>
    <input type="text" name="topicname" placeholder="Topic" style="width: 100%; padding: 10px; margin-bottom: 10px;">
    
    <h2>Enter the Text</h2>
    <textarea name="text" placeholder="Enter your text here" style="width: 100%; height: 150px; padding: 10px; margin-bottom: 10px;"></textarea>
    
    <input type="file" name="image" accept="image/*" style="margin-bottom: 10px;">
    
    <input type="submit" value="Upload" name="signin" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;">
  </form>
</div>
      
             
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status=="success")
		{
		  swal("Blog succesfully uploaded",status)
		}
	if(status=="failed")
	{
	  swal("Blog uploading failed",message)
	}

	
	</script>

</body>
</html>