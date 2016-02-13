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
            <%
                try {

                    String checkLogin = request.getParameter("login");
                    String checkCadastro = request.getParameter("cadastro");

                    if (checkLogin.equals("ok")) {

                        String mat = request.getParameter("mat");
                        String pas = request.getParameter("pas");

                        Banco b = new Banco();
                        try {
                            Usuario u = b.login(mat, pas);
                            /* INICIANDO A SESSÃO */
                            session.setAttribute("id", u.getId());
                            session.setAttribute("nome", u.getNome());
                            session.setAttribute("matricula", u.getMatricula());
                            session.setAttribute("senha", u.getSenha());

                            response.sendRedirect("perfil.jsp");

                        } catch (NullPointerException e) {
            %>
            <script>alert("Matricula ou senha incorreta!! :(");</script>
            <%
                        }
                    }

                } catch (NullPointerException e) {

                }
            %>
            <div class='content'>
                <div>
                    <form action="#" method="post">
                        <p class='subtitle'>Login</p>
                        <center>
                            <input type="text" placeholder="Matricula" name='mat' required><br> 
                            <input type="password" placeholder="Senha" name='pas' required><br>
                            <input name='login' type="hidden"    value="ok">
                            <input type="submit" value="Entrar"> 
                            <a href="cadastro.jsp"><input type="button" value="Cadastre-se"></a>     
                        </center>
                    </form>
                </div>
            </div>
        </div>
        <%
            try {
                String checkCadastro = request.getParameter("cadastro");

                if (checkCadastro.equals("ok")) {
                    out.print("<br><br><br><center><h1 class='subtitle'>Usuário cadastrado com sucesso!</h1></center>");
                }

            } catch (NullPointerException e) {

            }

        %>
    </body>
</html>
