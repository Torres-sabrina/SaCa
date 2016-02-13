
package data;

import java.util.Date;
import java.sql.Time;

public class Questao {

    static void add(String q) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        
    private int     id;
    private String  tema;
    private String  subtema;
    private String  resposta;
    private String  questao;
    private int     id_usuario;
    private int     dificuldade;
    private Date    data;
    private String  hora;
    private int     tipoQuestao;
    private String  autoria;

    Questao(String string, String string0, String string1, String string2, int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipoQuestao() {
        return tipoQuestao;
    }

    public void setTipoQuestao(int tipoQuestao) {
        this.tipoQuestao = tipoQuestao;
    }
     public String getAutoria() {
        return autoria;
    }

    public void setAutoria(String autoria) {
        this.autoria = autoria;
    }
     
    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getSubtema() {
        return subtema;
    }

    public void setSubtema(String subtema) {
        this.subtema = subtema;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    public String getQuestao() {
        return questao;
    }

    public void setQuestao(String questao) {
        this.questao = questao;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getDificuldade() {
        return dificuldade;
    }

    public void setDificuldade(int dificuldade) {
        this.dificuldade = dificuldade;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

       
    public Questao( String tema, String subtema,String resposta,String questao, int tipoQuestao,
                int dificuldade,int id_usuario,Date data,String hora, String autoria){
   
        this.subtema        = subtema;
        this.tema           = tema;
        this.resposta       = resposta;   
        this.questao        = questao;   
        this.id_usuario     = id_usuario;   
        this.dificuldade    = dificuldade ;   
        this.data           = data;   
        this.hora           = hora;  
        this.tipoQuestao    = tipoQuestao;
        this.autoria        =autoria;
          
    }

    
    

    
}
