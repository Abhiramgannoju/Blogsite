<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About us</title>
<style>
  .container {
    background-color: red;
    margin: 50px auto;
    padding: 20px;
    border-radius: 1rem;
    width:500px;
  }

  .section {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .section h1 {
    text-align: center;
  }

  .section .content {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .section .content .box {
    background-color: lightblue;
    margin: 10px;
    padding: 10px;
    flex-basis: calc(50% - 20px);
    box-sizing: border-box;
  }

  @media (max-width: 768px) {
    .section .content .box {
      flex-basis: 100%;
    }
    .container {
    background-color: red;
    margin: 50px auto;
    padding: 10px;
    border-radius: 1rem;
    width:300px;
  }
  }
  @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
} 
nav{
  display: flex;
  height: 80px;
  width: 100%;
  background: #1b1b1b;
  align-items: center;
  justify-content: space-between;
  padding: 0 50px 0 100px;
  flex-wrap: wrap;
}
nav .logo{
  color: #fff;
  font-size: 35px;
  font-weight: 600;
}
nav ul{
  display: flex;
  flex-wrap: wrap;
  list-style: none;
}
nav ul li{
  margin: 0 5px;
}
nav ul li a{
  color: #f2f2f2;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  padding: 8px 15px;
  border-radius: 5px;
  letter-spacing: 1px;
  transition: all 0.3s ease;
}
nav ul li a.active,
nav ul li a:hover{
  color: #111;
  background: #fff;
}
nav .menu-btn i{
  color: #fff;
  font-size: 22px;
  cursor: pointer;
  display: none;
}
input[type="checkbox"]{
  display: none;
}
@media (max-width: 1000px){
  nav{
    padding: 0 40px 0 50px;
  }
}
@media (max-width: 920px) {
  nav .menu-btn i{
    display: block;
  }
  #click:checked ~ .menu-btn i:before{
    content: "\f00d";
  }
  nav ul{
    position: fixed;
    top: 80px;
    left: -100%;
    background: #111;
    height: 100vh;
    width: 100%;
    text-align: center;
    display: block;
    transition: all 0.3s ease;
  }
  #click:checked ~ ul{
    left: 0;
  }
  nav ul li{
    width: 100%;
    margin: 40px 0;
  }
  nav ul li a{
    width: 100%;
    margin-left: -100%;
    display: block;
    font-size: 20px;
    transition: 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }
  #click:checked ~ ul li a{
    margin-left: 0px;
  }
  nav ul li a.active,
  nav ul li a:hover{
    background: none;
    color: cyan;
  }
}
</style>
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
            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="create.jsp">Create Blogs</a></li>
            
            <li><a href="blogs.jsp">AllBlogs</a></li>
        
         </ul>
         

      </nav>
<div class="container">
  <div class="section">
    <h1 class="heading">About us</h1>
    <div class="content">
      <div class="content-box" Style="margin:20px;">
        As an AI language model, I don't have personal experiences or a physical presence, so I don't have an "about me" in the traditional sense. However, I can tell you that I am ChatGPT, a language model developed by OpenAI. I have been trained on a diverse range of data sources and can assist with a wide range of topics and tasks. My purpose is to generate human-like text based on the input I receive. If you have any specific questions or need assistance with anything, feel free to ask!
      </div>
      <div class="image-box">
        <img src="images/logo.jpeg" alt="sing up image" Style="margin:20px;">
      </div>
    </div>
  </div>
</div>
</body>
</html>