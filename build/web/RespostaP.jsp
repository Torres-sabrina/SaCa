<%-- 
    Document   : newjspTest
    Created on : 12/02/2016, 07:47:42
    Author     : admin
--%>

<%@page import="java.sql.ResultSet"%>
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
                <p class='title'> Banco de Questões </p>
            </div>
            <div class='content'>
                <div>
                       <center>                 
<!--                           <a style='float:left' href="Pesquisa.jsp"> <input type="button" class="put"  value="voltar"></a>
-->
                           <br>                                             
                           <h1>Resultado da pesquisa</h1>

        
        
        <%
            
            String tema = "";
            String subtema = "";
            String autoria = "";
            String data = "";
            int dificuldade = -1;
            
            Banco b = new Banco();
            String SQL = "SELECT * FROM questoes WHERE id > 0";
            
            try{
                tema        = request.getParameter("tema");
                subtema     = request.getParameter("subtema");
                autoria     = request.getParameter("autoria");
                data        = request.getParameter("data");
                dificuldade = Integer.parseInt(request.getParameter("dificuldade"));
            
             
            if (!tema.equals("")) {
                SQL += " AND tema like '%" + tema + "%'";
            }

            if (!subtema.equals("")) {
                SQL += " AND subtema like '%" + subtema + "%'";
            }
            if (!autoria.equals("")) {
                SQL += " AND autoria like '%" + autoria + "%'";
            }

            if (!data.equals("")) {
                SQL += " AND data = " + data;
            }
            
            if (dificuldade != -1) {
                SQL += " AND dificuldade = " + dificuldade;
            }
            
            ResultSet rs = b.executarConsulta(SQL);
                %>
                <br><br>
                <table id='tableResultSearch'>
                    <tr>
                      <th>Selecionar</th>  
                      <th>Questão</th>
                      <th>Tema</th> 
                      <th>Subtema</th>
                    </tr>
                    <% while(rs.next()){ %>
                    <tr id="<%= rs.getInt("id") %>">
                      <td><center><input type='checkbox'></center></td>
                      <td><%= rs.getString("questao") %></td>
                      <td><%= rs.getString("tema") %></td> 
                      <td><%= rs.getString("subtema") %></td>
                    </tr>
                    <% } %>
                </table>    
                <%
        }catch(Exception e){}
              
        %>
                           
        


                        </center>
                </div>
            </div>
        </div>

    </body>
</html>