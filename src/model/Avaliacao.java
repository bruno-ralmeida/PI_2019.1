package model;

import java.util.Date;

/**
*
* @author Bruno Rocha
*/
public class Avaliacao {
	
	private int id;
	private double nota;
	private Entrega entrega;
	private Grupo grupo;
	private Date dataAvaliacao;
	private String comentarios;
	private Aluno aluno;
	
	public Avaliacao(int id, double nota, String comentarios) {
		this.id = id;
		this.nota = nota;
		this.comentarios = comentarios;
	}
	
	public Avaliacao(Entrega entrega, Grupo grupo, int nota, Date dataAvaliacao, String comentarios) {
		this.entrega = entrega;
		this.grupo = grupo;
		this.nota = nota;
		this.dataAvaliacao = dataAvaliacao;
		this.comentarios = comentarios;
	}
	
	public Avaliacao() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Entrega getEntrega() {
		return entrega;
	}
	
	public void setEntrega(Entrega entrega) {
		this.entrega = entrega;
	}
	
	public Grupo getGrupo() {
		return grupo;
	}
	
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	
	public double getNota() {
		return nota;
	}
	
	public void setNota(double nota) {
		this.nota = nota;
	}
	
	public Date getDataAvaliacao() {
		return dataAvaliacao;
	}
	
	public void setDataAvaliacao(Date dataAvaliacao) {
		this.dataAvaliacao = dataAvaliacao;
	}
	
	public String getComentarios() {
		return comentarios;
	}
	
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}
	
	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	@Override
	public String toString() {
		return "Avaliacao [id=" + id + ", nota=" + nota + ", entrega=" + entrega + ", grupo=" + grupo
				+ ", dataAvaliacao=" + dataAvaliacao + ", comentarios=" + comentarios + ", aluno=" + aluno + "]";
	}
		

	
}
