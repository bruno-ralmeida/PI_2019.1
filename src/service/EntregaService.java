package service;

import java.io.Serializable;
import java.util.ArrayList;

import dao.EntregaDAO;
import model.Entrega;
import model.Grupo;

public class EntregaService implements Serializable{

     EntregaDAO dao;
	
	public EntregaService() {
		dao = new EntregaDAO();
	}
	
	public Entrega loadEntrega(int id) {
		return dao.selectEntrega(id);
	}
	
	public ArrayList<Entrega> selectNaoAvaliados(int id){
		return dao.selectAll(id);
	}
	
}
