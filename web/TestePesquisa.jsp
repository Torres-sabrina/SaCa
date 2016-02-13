<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="data.Questao"%>
<%@page import="data.Usuario"%>
<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de Questões</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>


        <div class='container'>
            <div class='banner'>
                <img src="">
                <p class='title'> Banco de Questões </p>
            </div>
            <div class='content'>
                <div>
                    <form action="newjspTest.jsp" method="post">
                        <p class='subtitle'>Pesquisa</p>
                        <center>
                            <input type="text" placeholder="Tema"  name="tema"><br>  
                            
                            <input type="text" placeholder="Subtema"  name="subtema"><br>        

                            <input type="text" placeholder="Autoria"  name="autoria"><br>              
                            
                            <input type="date"   name="data"><br>  
                            
                            
                            <select name="dificuldade" required> 
                                <option value="" selected>Dificuldade</option>
                                <option value="0">facil</option>
                                <option value="1">medio</option>
                                <option value="2">dificil</option>
                            </select>
                            <input type="submit" value="Pesquisar"><br>



                        </center>
                    </form>
                </div>
            </div>
        </div>
        <a href="perfil.jsp"> <input type="button" class="but" value="voltar"></a>

    </body>
</html>
