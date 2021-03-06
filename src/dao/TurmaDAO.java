package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConnectionFactory;
import model.Professor;
import model.Turma;


public class TurmaDAO {
	public Turma anoCorrente() {
		// RETORNA O ANO CORRENTE
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT  ano_letivo, semestre_letivo "
				+ 	       "FROM turma ORDER BY ano_letivo DESC, semestre_letivo  "
				+ 		   "DESC LIMIT 1";

		Turma turma = null;

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {

			ResultSet rs = stm.executeQuery();

			if (rs.next()) {
				turma = new Turma();
				turma.setAnoLetivo((rs.getInt("ano_letivo")));
				turma.setSemestreLetivo((rs.getInt("semestre_letivo")));
				
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

		return turma;
	}
	
	
	//Carrega Todos os anos/semestres -------------------------------------------------------------------------
		public ArrayList<Turma> mostrarAno() {
			Turma turma = null;
			ArrayList<Turma> lista = new ArrayList<Turma>();

			Connection conn = new ConnectionFactory().getConnection();
			String sqlInsert = "SELECT DISTINCT ano_letivo, semestre_letivo FROM turma ORDER BY ano_letivo DESC, semestre_letivo  DESC";

			try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){
				ResultSet rs = stm.executeQuery();

				while(rs.next()) {
					int ano = rs.getInt("ano_letivo");
					int semestre = rs.getInt("semestre_letivo");
					turma = new Turma(semestre, ano);
					
					lista.add(turma);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return lista;
		}	
		
	
		
		/**
		 * Retorna todas as turmas referente a um per�odo (ano letivo, semestre)
		 * @param ano
		 * @param semestre
		 * @return ArrayList<Turma>
		 */
		public ArrayList<Turma> selectTurmaPeriodo( int idProf, int ano, int semestre) {
			ArrayList<Turma> lstTurma = new ArrayList<>();

			Connection conn = new ConnectionFactory().getConnection();
			String sqlInsert = "SELECT DISTINCT turma.id, turma.semestre_letivo, turma.ano_letivo, turma.sigla FROM turma " + 
					"												JOIN turma_aluno a ON turma.id = a.turma_id" + 
					"												JOIN grupo g ON a.grupo_id = g.id " + 
					"											   WHERE g.orientador_id = ?" + 
					"												 AND turma.ano_letivo = ?" + 
					"					                             AND turma.semestre_letivo = ?";

			try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){
				stm.setInt(1, idProf);
				stm.setInt(2, ano);
				stm.setInt(3, semestre);
				ResultSet rs = stm.executeQuery();

				while(rs.next()) {
					Turma turma = new Turma();

					turma.setId((rs.getInt("id")));
					turma.setSemestreLetivo((rs.getInt("semestre_letivo")));
					turma.setAnoLetivo((rs.getInt("ano_letivo")));
					turma.setSigla((rs.getString("sigla")));
					lstTurma.add(turma);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			return lstTurma;
		}

	

	public void create(Turma turma) {
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "INSERT INTO TURMA ( semestre_letivo, ano_letivo, "  +
						   " sigla, tema_id) VALUES (?, ?, ?, ?, ?)";

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setInt(1, turma.getSemestreLetivo());
			stm.setInt(2, turma.getAnoLetivo());
			stm.setString(3, turma.getSigla());
			stm.setInt(4, turma.getTema().getId());
			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	public Turma load(int id) { // retorna uma Grupo com base no ID dela
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT * FROM turma" + 
							"INNER JOIN turma_aluno" + 
							"ON turma.id = ?";

		Turma turma = null;

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setInt(1, id);

			ResultSet rs = stm.executeQuery();

			if (rs.next()) {
				turma = new Turma();
				TemaDAO temaDAO = new TemaDAO();

				turma.setId((rs.getInt("id")));
				turma.setSemestreLetivo((rs.getInt("semestre_letivo")));
				turma.setAnoLetivo((rs.getInt("ano_letivo")));
				turma.setSigla((rs.getString("sigla")));
				turma.setTema(temaDAO.loadTema(rs.getInt("tema_id")));
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

		return turma;
	}
	
	public ArrayList<Turma> selectId(int id) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT DISTINCT turma.id, turma.semestre_letivo, turma.ano_letivo, turma.sigla FROM turma  JOIN turma_aluno a ON turma.id = a.turma_id " + 
				"						 JOIN grupo g ON a.grupo_id = g.id " + 
				"						 where g.orientador_id = ?";
		
		Turma turma = null;
		ArrayList<Turma> turmas = new ArrayList<>();
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			stm.setInt(1, id);
	
			
			ResultSet rs = stm.executeQuery();
			
            while(rs.next()) {
            	int idT = rs.getInt("turma.id");
            	int semestre = rs.getInt("turma.semestre_letivo");
            	int anoLetivo = rs.getInt("turma.ano_letivo");
            	String sigla =  rs.getString("turma.sigla");
            	
            	turma = new Turma(idT, semestre, anoLetivo, sigla);
            	
            	turma.setId(rs.getInt("turma.id"));
            	turma.setSemestreLetivo(rs.getInt("turma.semestre_letivo"));
            	turma.setAnoLetivo(rs.getInt("turma.ano_letivo"));
            	turma.setSigla(rs.getString("turma.sigla"));
            	turmas.add(turma);
            }
            
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return turmas;
	}
	/**
	 * Retorna todas as turmas referente a um per�odo (ano letivo, semestre)
	 * @param ano
	 * @param semestre
	 * @return ArrayList<Turma>
	 */
	public ArrayList<Turma> getTurmasPeriodo(int ano, int semestre) {
		ArrayList<Turma> lstTurma = new ArrayList<>();

		Connection conn = new ConnectionFactory().getConnection();
		String sqlInsert = "SELECT * FROM turma WHERE ano_letivo = ? AND semestre_letivo = ?";

		try(PreparedStatement stm = conn.prepareStatement(sqlInsert)){
			stm.setInt(1, ano);
			stm.setInt(2, semestre);
			ResultSet rs = stm.executeQuery();

			while(rs.next()) {
				Turma turma = new Turma();
				turma.setId(rs.getInt("id"));
				turma.setSigla(rs.getString("sigla"));
				turma.setAnoLetivo(rs.getInt("ano_letivo"));
				turma.setSemestreLetivo(rs.getInt("semestre_letivo"));
				lstTurma.add(turma);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return lstTurma;
	}
	

}
