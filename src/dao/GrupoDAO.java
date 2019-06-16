package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConnectionFactory;
import model.Grupo;
import model.Turma;

public class GrupoDAO {
	
	// retorna uma Grupo com base no ID dela
	public Grupo load(int id) { 
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT * FROM grupo WHERE id=?";
		ProfessorDAO professorDAO = new ProfessorDAO();
		Grupo grupo = new Grupo();

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setInt(1, id);

			ResultSet rs = stm.executeQuery();

			if (rs.next()) {
				grupo.setId(id);
				grupo.setNumero(rs.getInt("numero"));
				grupo.setNome((rs.getString("nome")));
				grupo.setOrientador(professorDAO.load(rs.getInt("orientador_id")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return grupo;
	}
	
	/**
	 * Carregar grupos de acordo com a turma
	 * @param idTurma
	 * @return ArrayList<Grupo>
	 */
	public ArrayList<Grupo> loadGrupoByTurma(int idTurma) {
		ArrayList<Grupo> lista = new ArrayList<>();
		ProfessorDAO professorDAO = new ProfessorDAO();
		Connection conn = new ConnectionFactory().getConnection();
		String sqlInsert = "SELECT DISTINCT g.nome, g.numero, g.orientador_id, g.id FROM turma t\n" + 
				"						 JOIN turma_aluno a ON t.id = a.turma_id\n" + 
				"						 JOIN grupo g ON a.grupo_id = g.id\n" + 
				"						 WHERE t.id = ?";

		try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){
			stm.setInt(1, idTurma);
			
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				Grupo grupo = new Grupo();
				grupo.setId(rs.getInt("id"));
				grupo.setNome(rs.getString("nome"));
				grupo.setNumero(rs.getInt("numero"));
				grupo.setOrientador(professorDAO.load(rs.getInt("orientador_id")));
				lista.add(grupo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	
	/**
	 * Carregar grupos de acordo com a turma
	 * @param idTurma
	 * @return ArrayList<Grupo>
	 */
	public ArrayList<Grupo> selectGrupoNome(int idTurma, String grupoNome) {
		ArrayList<Grupo> lista = new ArrayList<>();
		ProfessorDAO professorDAO = new ProfessorDAO();
		Connection conn = new ConnectionFactory().getConnection();
		String sqlInsert = "SELECT DISTINCT g.nome, g.numero, g.orientador_id, g.id FROM turma t" + 
				"						 JOIN turma_aluno a ON t.id = a.turma_id" + 
				"						 JOIN grupo g ON a.grupo_id = g.id " + 
				"						 WHERE a.turma_id = ?" + 
				"						 AND g.nome like ?";

		try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){
			stm.setInt(1, idTurma);
			stm.setString(2, "%" + grupoNome + "%");
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				Grupo grupo = new Grupo();
				grupo.setId(rs.getInt("id"));
				grupo.setNome(rs.getString("nome"));
				grupo.setNumero(rs.getInt("numero"));
				grupo.setOrientador(professorDAO.load(rs.getInt("orientador_id")));
				lista.add(grupo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	/***
	 * 
	 * @return Carrega todos os grupos
	 */
	public ArrayList<Grupo> carrega() {
		ArrayList<Grupo> lista = new ArrayList<>();
		ProfessorDAO professorDAO = new ProfessorDAO();
		Connection conn = new ConnectionFactory().getConnection();
		String sqlInsert = "SELECT * FROM grupo";

		try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){

			ResultSet rs = stm.executeQuery();

			while(rs.next()) {
				Grupo grupo = new Grupo();
				grupo.setId(rs.getInt("id"));
				grupo.setNome(rs.getString("nome"));
				grupo.setNumero(rs.getInt("numero"));
				grupo.setOrientador(professorDAO.load(rs.getInt("orientador_id")));
				lista.add(grupo);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}

}
