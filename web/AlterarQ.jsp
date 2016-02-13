<%@page import="java.sql.ResultSet"%>
<%@page import="data.Usuario"%>
<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <%
        out.println(Banco.login);
        if (session.getAttribute("login") == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de Questões</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%            
            String coluna = request.getParameter("coluna");
            String valor = request.getParameter("valor");

            if (coluna == null) {
        %>
        <div class='container'>
            <div class='banner'>
                <img src="">
                <p class='title'> Banco de Questões </p>
            </div>
            <div class='content'>
                <div>
             <form action="ConsultarLivro.jsp" method="post">        
     <p class='subtitle'>Alterar questões</p>
                        <center>
                 <h1>Alterar LIVRO</h1>
                 
            Coluna: <select name="coluna">
                <option value="id">ID</option>
                <option value="titulo">Titulo</option>
                <option value="subtitulo">Subtema</option>
                <option value="autoria">Autoria</option>
                <option value="data">Data</option>
                <option value="dificuldade">Dificuldade</option>
                <option value="tipoQuestoa">Tipo de questão</option>                
                <option value="questoa">questão</option>
                <option value="resposta">Resposta</option>
            </select> <br>
            Valor: <input type="text" name="valor"> <br><br>
            <input type="submit" value="CONSULTAR">
            <BR><BR>
        
                     <%} else {
            Banco b = new Banco();
            ResultSet livros = b.consultarLivro(coluna, valor);
            while (livros.next()) {
        %>
        TITULO: <input type="text" size="100" value="<%=livros.getString("titulo")%>"><BR>
        ID: <input type="text" size="100" value="<%=livros.getString("id")%>"><BR>
        AUTOR: <input type="text" size="100" value="<%=livros.getString("autor")%>"><BR>
        EDICAO: <input type="text" size="100" value="<%=livros.getString("edicao")%>"><BR>
        EDITORA: <input type="text" size="100" value="<%=livros.getString("editora")%>"><BR>
        ANO: <input type="text" size="100" value="<%=livros.getString("ano")%>"><BR>
        CÓDIGO: <input type="text" size="100" value="<%=livros.getString("codigo")%>"><BR>
        EXEMPLARES: <input type="text" size="100" value="<%=livros.getString("exemplares")%>"><BR>
        PRECO: <input type="text" size="100" value="<%=livros.getString("preco")%>"><BR>
        LANCAMENTO: <input type="text" size="100" value="<%=livros.getString("lancamento")%>"><BR>
        AREA: <input type="text" size="100" value="<%=livros.getString("area")%>"><BR>
        DISPONIVEL: <input type="text" size="100" value="<%=livros.getString("disponivel")%>"><BR>
        ATIVO: <input type="text" size="100" value="<%=livros.getString("ativo")%>"><BR>
        <BR><BR><BR>
        <%
                }
                b.logIt(session.getAttribute("id")+"", "consultou livro com sucesso ("+coluna+"="+valor+")");
            }
        %>       
                            
                            
                            
                            
                               
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
                                
                                
                                <input type="tex" placeholder="Questão" required name="questao">  <br> 
                                <input type="textarea" placeholder="Resposta esperada" required name="resposta"><br>
                                <input type='hidden' name='cadastroQuestao' value='ok'>
                                <input type="submit" value="Alterar"> 
                                <a href="index.jsp"><input type="button" value="Cancelar"></a> <br>
                            </div><br>
                            <div>

                                <a href="perfil.jsp"><input type="submit" value="voltar"></a>
                            </div>

                        </center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
