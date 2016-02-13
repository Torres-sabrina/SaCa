<%@page import="data.Usuario"%>
<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= session.getAttribute("nome")%></title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class='container'>
            <div class='banner'>
                <h1>olá</h1>  <p class='title'> Banco de Questões </p> 
            </div><br>


            <div>
                <form action="#" method="post">

                    <center>
<br>
                        <div>  <a href="CadastroQuestao.jsp"><input type="button" class='i2Style' value="Cadastrar questões"></a></div><br>
                        <div> <a href="Pesquisa.jsp"><input type="button" class='i2Style' value="Pesquisar "></a> </div><br>  

                    </center>
                </form>

            </div>
        </div>

    </body>
</html>
