<%
if(session.getAttribute("name")==null)
	response.sendRedirect("login.jsp");
	
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Blogsite</title>
      <link rel="stylesheet" href="css/index2.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
   </head>
   <body>
      <nav>
         <div class="logo">
            BlogSite
         </div>
         <input type="checkbox" id="click">
         <label for="click" class="menu-btn">
         <i class="fas fa-bars"></i>
         </label>
         <ul>
            <li><a class="active" href="#">Home</a></li>
            <li><a href="create.jsp">Create Blog</a></li>
            <li><a href="blogs.jsp">All Blogs</a></li>
            <li><a href="about.jsp">About us</a></li>
            <li><a href="login.jsp">Log Out</a></li>
         </ul>
      </nav>
      <div Style="background-color:#E57C23;">
     <div class="container">
    <img  src="images/logo.jpeg" alt="Your Image">
    <h1>Welcome to the blog site</h1>
    <p> Show And enchance your blooging skills</p>
  </div>
  </div>
  <div Style="background-color:red;">
     <div class="container2">
       <div class="div1">
           <h1 Style="text-align:center">Earn money by bloging</h1>
           <p Style="text-align:center">
              Create a beautiful blog that fits your style. Choose from a selection of easy to use templates all with flexible layouts and hundreds of background images  or design something new.
           </p>
       </div>
       <div class="div2">
       <img class="cima"src="images/logo.jpeg">
       </div>
  </div>
    <div class="container">
    <a href="create.jsp"><button class="button-24" role="button">Create blog</button></a>
    </div>
  </div>
   </body>

</html>