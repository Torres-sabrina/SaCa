package data;




public class Usuario {
        
    private int     id;
    private String  nome;
    private String  matricula;
    private String  senha;
    private String  email;
    private int     idade;
    private int     sexo;
    private int     nivel;
    
    
      
    // CONSTRUTOR DA PARTE CADASTRO...
    public Usuario(String nome, String matricula,String senha, String email, int sexo, int idade,int nivel){
        this.nome       = nome;
        this.matricula  = matricula;
        this.senha      = senha; 
        this.email      = email;
        this.sexo       = sexo;
        this.idade      = idade;
        this.nivel      = nivel;
    }
    
    // OUTRO FINS...
    public Usuario(int id, String nome, String matricula,String senha, String email, int nivel, int sexo, int idade){
        this.id         = id;
        this.nome       = nome;
        this.matricula  = matricula;
        this.senha      = senha; 
        this.email      = email;
        this.nivel      = nivel;
        this.sexo      = sexo;
        this.idade      = idade;
        
        
        
    }
    
    

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
  

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
        
    
    
    
}
