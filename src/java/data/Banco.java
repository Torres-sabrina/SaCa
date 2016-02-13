package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Banco {

    public Connection conectar() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/TCC", "root", "1234");
        } catch (SQLException e) {
            System.out.println("SQL ERROR");
        } catch (ClassNotFoundException ex) {
        }
        return conn;
    }

    /* FUNCIONES */
    public void cadastrarUsuario(Usuario user) {
        try {
            String comando = "INSERT INTO usuario (nome,matricula,email,senha,idade,sexo,nivel) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement stmt = new Banco().conectar().prepareStatement(comando);
            stmt.setString(1, user.getNome());
            stmt.setString(2, user.getMatricula());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getSenha());
            stmt.setInt(5, user.getIdade());
            stmt.setInt(6, user.getSexo());
            stmt.setInt(7, user.getNivel());

            stmt.execute();
        } catch (SQLException e) {
            System.out.println("DEU ERRO!!!!" + e.getMessage());
        }
    }

    public Usuario login(String mat, String pas) {
        Usuario us = null;
        try {
            String comando = "SELECT * FROM usuario WHERE matricula = " + mat + " AND senha = " + pas + "  ";
            Statement stmt = new Banco().conectar().createStatement();
            ResultSet rs = stmt.executeQuery(comando);

            while (rs.next()) {
                us = new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("matricula"), rs.getString("senha"), rs.getString("email"), rs.getInt("nivel"), rs.getInt("idade"), rs.getInt("sexo"));
            }

        } catch (SQLException e) {
            System.out.println("DEU ERRO!!!!" + e.getMessage());
        }
        return us;
    }

    public ArrayList<String> selecionarColunas(String tabela) {
        ArrayList<String> cols = new ArrayList<String>();
        int count;
        try {
            String comando = "SELECT * FROM " + tabela;
            Statement stmt = new Banco().conectar().createStatement();
            ResultSet rs = stmt.executeQuery(comando);
            ResultSetMetaData rsmt = rs.getMetaData();

            count = rsmt.getColumnCount();

            for (int i = 1; i <= count; i++) {
                cols.add(rsmt.getColumnName(i));
            }

        } catch (SQLException e) {
            System.out.println("ERRO AO SELECIONAR COLUNAS" + e.getMessage());
        }
        return cols;
    }

    public Exception cadastrarQuestao(Questao l) {
        Exception ex = null;
        try {
            Date d = new Date();
            String data = (1900 + d.getYear()) + "-" + (d.getMonth() + 1) + "-" + d.getDate();
            System.out.println(data);
            String hora = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
            System.out.println(hora);
            String comando = "INSERT INTO `tcc`.`questoes` (`tema`, `subtema`, `id_usuario`, `dificuldade`, `resposta`, `questao`, `data`, `hora`, `tipoQuestao`,`autoria`) VALUES ('" + l.getTema() + "', '" + l.getSubtema() + "', " + l.getId_usuario() + ", " + l.getDificuldade() + ", '" + l.getResposta() + "', '" + l.getQuestao() + "', '" + data + "', '" + hora + "', '" + l.getTipoQuestao() + "', '" + l.getAutoria() + "')";
            Statement stmt = new Banco().conectar().createStatement();
            stmt.execute(comando);

        } catch (SQLException e) {
            ex = e;
            System.out.println("ERRO AO CADASTRAR questão" + e.getMessage());
        }
        return ex;
    }

  //  public ResultSet pesquisa(String pesquisa){
    //      ResultSet rs = null;
    //      try {
    //         String comando = "SELECT * FROM livro "+pesquisa;
    //         Statement stmt = new Banco().conectar().createStatement();
    //        rs   = stmt.executeQuery(comando);
    //   } catch (SQLException e) {
    //      System.out.println("ERRO AO SELECIONAR "+e.getMessage());
    // }
    // return rs;
    //}
    //  public Questao pesquisaPeloId(int id){
    //  Questao l = null;
    //   ResultSet rs = null;
    //   try {
    //     String comando = "SELECT * FROM livro WHERE id = "+id;
    //    Statement stmt = new Banco().conectar().createStatement();
    //   rs   = stmt.executeQuery(comando);
    //   while(rs.next()){
    //      l = new Questao(rs.getInt("id"),rs.getString("titulo") , rs.getString("autor"),
    //              rs.getString("editora"), rs.getString("codigo"), rs.getInt("edicao"),
    //              rs.getInt("ano"), rs.getInt("exemplares"), rs.getDouble("preco"), 
    //              rs.getDate("lancamento"), rs.getBoolean("disponivel"), rs.getString("area").charAt(0));
    //  }
    //     
    // } catch (SQLException e) {
    //     System.out.println("ERRO AO SELECIONAR "+e.getMessage());
    // }
    //  return l;
    //}
    public void alterar(Questao l) {
        try {
            String comando = "UPDATE INTO questoes (id,tema,subtema,id_usuario,dificuldade,"
                    + "resposta,questao,data,hora,tipoQuestao,autoria) "
                    + "VALUES (" + l.getId() + ",'" + l.getTema() + "','" + l.getAutoria() + "','" + l.getSubtema() + "','" + l.getId_usuario() + "',"
                    + "" + l.getDificuldade() + "," + l.getResposta() + "," + l.getQuestao() + ",'" + l.getData() + "',"
                    + "" + l.getHora() + "' ," + l.getTipoQuestao() + " ) ";
            Statement stmt = new Banco().conectar().createStatement();
            stmt.execute(comando);
        } catch (SQLException e) {
            System.out.println("ERRO AO ATUALIZAR " + e.getMessage());
        }
    }

   // public void excluir(int id){
    //   try {
    //      String comando = "DELETE FROM livro WHERE id = "+id;
    //       Statement stmt = new Banco().conectar().createStatement();
    //   stmt.execute(comando);   
    //  } catch (SQLException e) {
    //       System.out.println("ERRO AO EXCLUIR "+e.getMessage());
    //    }
    // }
   public ResultSet consultarQuestoes(int id) throws SQLException{
       Statement stmt = new Banco().conectar().createStatement();
         return stmt.executeQuery("select * from questoes where id = " + id);
    }
    
    public ResultSet executarConsulta(String SQL) throws SQLException{
        Statement stmt = new Banco().conectar().createStatement();
         return stmt.executeQuery(SQL);
    }
    
    public int gerarId() {
        int id = 0;
        try {
            String commando = "SELECT * FROM questoes";
            Statement stmt = new Banco().conectar().createStatement();
            ResultSet rs = stmt.executeQuery(commando);
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
        }

        return id + 1;
    }

}
