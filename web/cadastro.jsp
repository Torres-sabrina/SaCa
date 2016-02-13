<%@page import="java.lang.String"%>
<%@page import="data.Banco"%>
<%@page import="data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de Questões</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
           try{

               String check = request.getParameter("cadastro");
               if(check.equals("ok")){
                   String nome     =  request.getParameter("name");
                   String matri    =  request.getParameter("matricula");
                   String pass     =  request.getParameter("pass");
                   int idade       =  Integer.parseInt(request.getParameter("idade"));
                   String email    =  request.getParameter("email");
                   int sexo        =  Integer.parseInt(request.getParameter("sexo"));

                   Usuario u = new Usuario(nome, matri, pass, email, sexo, idade,0);
                   Banco b = new Banco();
                   b.cadastrarUsuario(u);
                    
                   response.sendRedirect("?cadastro=ok");
               }
           }catch(NullPointerException e){

           }

        %>

        <div class='container'>
            <div class='banner'>
                <img src="">
                <p class='title'> Banco de Questões </p>
            </div>
            <div class='content'>
                <div>
                    <form action="#" method="post">
                        <p class='subtitle'>Cadastre-se</p>
                        <center>
                            <input type="text" placeholder="Nome" required name="name"><br> 
                            <input type="text" placeholder="Matricula" required name="matricula" > <br>
                            <input type="email" placeholder="Email" required name='email'><br>
                            <input type="password" placeholder="Senha" required name='pass'><br>
                            <input type="text" placeholder="Idade" required name='idade'><br>
                            <select name="sexo">
                                <option value="0"> Masculino </option>
                                <option value="1"> Feminino </option>
                            </select><br>
                            <input type='hidden' name='cadastro' value='ok'>
                            <input type="submit" value="Cadastrar"> 
                            <a href="index.jsp"> <input type="button" value="Cancelar"> </a>     
                        </center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
