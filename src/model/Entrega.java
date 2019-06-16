package model;

import java.sql.Date;

/**
*
* @author Grupo PI
*/
public class Entrega {

	private int id;
	private Grupo grupo;
	private Atividade atividade;
	private Date dataCadastro;
	private String link;
	
	public Entrega() {
		// TODO Auto-generated constructor stub
	}
	
	public Entrega(int id, Date dtCadastro) {
		this.id = id;
		this.dataCadastro = dtCadastro;
	}
		
	public Entrega(Grupo grupo, Atividade atividade, int id, Date dtCadastro) {
		this.id = id;
		this.grupo = grupo;
		this.atividade = atividade;
		this.dataCadastro = dtCadastro;
	}
	
	public Entrega(Grupo grupo, Atividade atividade, int id, Date dtCadastro, String link) {
		this.id = id;
		this.grupo = grupo;
		this.atividade = atividade;
		this.dataCadastro = dtCadastro;
		this.link = link;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Grupo getGrupo() {
		return this.grupo;
	}
	
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	
	public Atividade getAtividade() {
		return this.atividade;
	}
	
	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getDtCadastro() {
		return this.dataCadastro;
	}
	
	public void setDtCadastro(Date dtCadastro) {
		this.dataCadastro = dtCadastro;
	}

	@Override
	public String toString() {
		return "Entrega [id=" + id + ", grupo=" + grupo + ", atividade=" + atividade + ", dataCadastro=" + dataCadastro
				+ "]";
	}

}