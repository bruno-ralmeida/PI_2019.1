package model;

/**
 *
 * @author Bruno Rocha
 */
public abstract class Usuario {
    
	private int id;
    private String nome;
    private String email;
    private String senha;

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }
    
    public Usuario(int id, String nome, String email, String senha) {
    	this.id = id;
    	this.nome = nome;
        this.email = email;
        this.senha = senha;
    }
    
    public Usuario(int id, String nome, String email) {
    	this.id = id;
    	this.nome = nome;
        this.email = email;
    }
    
    public int getId() {
    	return this.id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }
    
    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
