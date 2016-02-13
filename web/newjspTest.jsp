<%@page import="data.Banco"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
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
            while(rs.next()){
                %>
                <h1><input type='checkbox'><%= rs.getString("questao")+" - "+rs.getInt("dificuldade") %></h1>
                
                <%
            }
            
        }catch(Exception e){}
              
        %>
    </center>
    </body>
</html>

