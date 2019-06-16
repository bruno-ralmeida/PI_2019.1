package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConnectionFactory;
import model.Atividade;
import model.Entrega;
import model.Grupo;
import service.AtividadeService;
import service.GrupoService;
import dao.AtividadeDAO;

public class EntregaDAO {

	public Entrega selectEntrega(int id) {
		Entrega entrega= new Entrega();
		GrupoService gs = new GrupoService();
		AtividadeService as = new AtividadeService();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT * FROM entrega WHERE entrega.id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setInt(1,id);
			ResultSet rs = stm.executeQuery();
			
			if(rs.next()) {
				entrega.setGrupo(gs.load(rs.getInt("grupo_id")));
				entrega.setAtividade(as.load(rs.getInt("atividade_id")));
				entrega.setId(rs.getInt("id"));
				entrega.setDtCadastro(rs.getDate("dt_cadastro"));
				entrega.setLink(rs.getString("link"));
			} 
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return entrega;
	}
	
	/***
	 * 
	 * @param grupo
	 * @return returna todas as entregas de um grupo
	 */
	public ArrayList<Entrega> selectAll(int id){
		ArrayList<Entrega> listaEntrega= new ArrayList<Entrega>();
		AtividadeDAO dao = new AtividadeDAO();
		GrupoDAO grupoDAO = new GrupoDAO();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT *" + 
				           "  FROM ENTREGA E" + 
				           " WHERE E.ID NOT IN (SELECT ENTREGA_ID FROM AVALIACAO)" + 
				           "   AND E.GRUPO_ID = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Entrega entrega = new Entrega();
				entrega.setId(rs.getInt("id"));
				entrega.setDtCadastro(rs.getDate("dt_cadastro"));
				entrega.setAtividade(dao.load(rs.getInt("atividade_id")));
				entrega.setGrupo(grupoDAO.load(rs.getInt("grupo_id")));
				entrega.setLink(rs.getString("link"));
				listaEntrega.add(entrega);
			} 
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return listaEntrega;
	}
	
}
