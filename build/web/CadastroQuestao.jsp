<%@page import="data.Questao"%> 
<%@page import="java.util.Date"%>
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
        <%
            try {

                String tema = request.getParameter("conteudo");
                    if (tema != null){

                    String subtema = request.getParameter("subtema");
                    String resposta = request.getParameter("resposta");
                    String questao = request.getParameter("questao");
                     
                    int tipoQuestao = Integer.parseInt(request.getParameter("tipoQuestao"));
                    int dificuldade = Integer.parseInt(request.getParameter("dificuldade"));
                    int id_usuario  = Integer.parseInt(session.getAttribute("id")+"");
                    Date data = new Date(); 
                    String hora = data.getHours() + ":" + data.getMinutes() + ":" + data.getSeconds();
                    String autoria = request.getParameter("autoria");

                    Questao q = new Questao(tema, subtema, resposta, questao, tipoQuestao, dificuldade, id_usuario, data, hora, autoria);
                    Banco b = new Banco();
                    b.cadastrarQuestao(q);

                    response.sendRedirect("?CadastroQuestao=ok");
                }
            } catch (NullPointerException e) {

            }
        %>
        <div class='container'>
            <div class='banner'>
                <img src="">
                <p class='title'> Banco de Questões </p>
            </div>
            <div class='content'>
                <div>
                    <form action="CadastroQuestao.jsp" method="post">
                        <p class='subtitle'>Cadastro de questões</p>
                <center>
                            <div id="tabeladealteracao">
                                <input type="text" placeholder="Conteúdo" required name="conteudo"><br>  
                                <input type="text" placeholder="Subtema" required name="subtema"><br> 
                                <input type="text" placeholder="Autoria" required name="autoria"><br> 
                                <select name="dificuldade">
                                    <option value="0">Fácil</option>
                                    <option value="1">Médio</option>
                                    <option value="2">Difícil</option>
                                </select><br>
                                
                                <select name="tipoQuestao">
                                    <option value="0">Discursiva</option>
                                    <option value="1">Objetiva</option>
                                </select><br>
                                
                                <input type="text" placeholder="Questão" required name="questao"><br> 
                                
                                <input type="text" placeholder="Resposta esperada" required name="resposta"><br>
                                <input type='hidden' name='cadastroQuestao' value='ok'>
                                <a href="perfil.jsp"><input type="submit" value="Cadastrar"></a>
                                <a href="index.jsp"><input type="button" value="Cancelar"></a><br>
                                
                            </div>
                    <div><a href="perfil.jsp"><input type="submit" value="voltar"> </a></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
