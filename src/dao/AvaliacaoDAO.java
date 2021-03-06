package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connection.ConnectionFactory;
import model.Avaliacao;
import model.Entrega;

public class AvaliacaoDAO {
	
	/**
     * CRUD: Insere banca
     * @param conn: Connection
     */
	
	
	public void insertAvaliacao(Avaliacao avaliacao, int idGrupo, int id) {
		Connection conn = new ConnectionFactory().getConnection();
	
		String sql = "INSERT INTO Avaliacao (entrega_id, turma_aluno_id, nota, comentarios, dt_avaliacao) VALUES (?, ?, ?, ?, ?)";
		
		try(PreparedStatement stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

				stm.setInt(1, avaliacao.getEntrega().getId());
				stm.setInt(2,id);
				stm.setDouble(3, avaliacao.getNota());
				stm.setString(4, avaliacao.getComentarios());
				stm.setDate(5, (Date) avaliacao.getDataAvaliacao());	
			
			
			int affectedRows = stm.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("Erro na avaliação. Nenhuma linha criada");
	        }

	        try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
	        	if (generatedKeys.next()) avaliacao.setId((int) generatedKeys.getLong(1));
	        	else throw new SQLException("Cria��o de banca falhou. Nenhum id criado");
	        }
	        
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * CRUD: Atualiza banca
     * @param conn: Connection
     */
	public void updateAvaliacao(ArrayList<Avaliacao> listaAvaliacao) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "UPDATE Avaliacao SET nota = ?, comentarios = ? WHERE id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand, Statement.RETURN_GENERATED_KEYS)){
			for(int i = 0; i < listaAvaliacao.size(); i++) {
				System.out.println("ATUALIAZANDO DAO " + listaAvaliacao.get(i).getNota());
				stm.setDouble(1, listaAvaliacao.get(i).getNota());
				stm.setString(2, listaAvaliacao.get(i).getComentarios());
				stm.setInt(3, listaAvaliacao.get(i).getId());
				stm.executeUpdate();
			}	
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erro ao alterar: " + e);
		}
		
	}
	
	public Avaliacao selectId(int id) {
		Avaliacao avaliacao = new Avaliacao();
		AlunoDAO alunoDAO = new AlunoDAO();
		EntregaDAO entregaDAO = new EntregaDAO();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT * FROM avaliacao WHERE id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setInt(1,id);
			ResultSet rs = stm.executeQuery();
			
			if(rs.next()) {
				avaliacao.setNota(rs.getDouble("Nota"));
				avaliacao.setDataAvaliacao(rs.getDate("dt_avaliacao"));
				avaliacao.setComentarios(rs.getString("Comentario"));
				avaliacao.setAluno(alunoDAO.loadTurmaAluno(rs.getInt("turma_aluno_id")));
				avaliacao.setEntrega(entregaDAO.selectEntrega(rs.getInt("entrega_id")));
				
			} 
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return avaliacao;
	}
	
	public ArrayList<Avaliacao> selectEntrega(int entrega) {
		AlunoDAO alunoDAO = new AlunoDAO();
		EntregaDAO entregaDAO = new EntregaDAO();
		ArrayList<Avaliacao> lista = new ArrayList<Avaliacao>();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT * FROM avaliacao WHERE entrega_id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setInt(1,entrega);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Avaliacao avaliacao = new Avaliacao();
				avaliacao.setId(rs.getInt("id"));
				avaliacao.setNota(rs.getDouble("Nota"));
				avaliacao.setDataAvaliacao(rs.getDate("dt_avaliacao"));
				avaliacao.setComentarios(rs.getString("comentarios"));
				avaliacao.setAluno(alunoDAO.loadTurmaAluno(rs.getInt("turma_aluno_id")));
				avaliacao.setEntrega(entregaDAO.selectEntrega(rs.getInt("entrega_id")));
				lista.add(avaliacao);
			} 
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Dados carregados SEM sucesso erro: " + e);
		}
		return lista;
	}
	
	public ArrayList<Avaliacao> selectAvaliadosNome(int idProf, String nomeAluno, int idTurma) {
		AlunoDAO alunoDAO = new AlunoDAO();
		EntregaDAO entregaDAO = new EntregaDAO();
		ArrayList<Avaliacao> lista = new ArrayList<Avaliacao>();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT AV.ID, AV.NOTA, AV.DT_AVALIACAO, AV.COMENTARIOS, AV.TURMA_ALUNO_ID, AV.ENTREGA_ID " + 
						   "  FROM USUARIO A " + 
						   "  JOIN TURMA_ALUNO TA " + 
						   "    ON TA.ALUNO_ID = A.ID" + 
						   "  JOIN AVALIACAO AV " + 
						   "    ON AV.TURMA_ALUNO_ID = A.ID" + 
						   "  JOIN ENTREGA E" + 
						   "    ON E.ID =  AV.ENTREGA_ID" + 
						   "  JOIN GRUPO G " + 
						   "    ON G.ID = E.GRUPO_ID" + 
						   "  JOIN TURMA T" + 
						   "    ON T.ID = TA.TURMA_ID" + 
						   " WHERE G.ORIENTADOR_ID = ?" + 
						   "   AND A.NOME like ?" + 
						   "   AND T.ID = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			stm.setInt(1,idProf);
			stm.setString(2, "%" + nomeAluno + "%");
			stm.setInt(3, idTurma);
			System.out.println(nomeAluno + " no Banco");
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Avaliacao avaliacao = new Avaliacao();
				avaliacao.setId(rs.getInt("AV.ID"));
				avaliacao.setNota(rs.getDouble("AV.NOTA"));
				avaliacao.setDataAvaliacao(rs.getDate("AV.DT_AVALIACAO"));
				avaliacao.setComentarios(rs.getString("AV.COMENTARIOS"));
				avaliacao.setAluno(alunoDAO.loadTurmaAluno(rs.getInt("AV.TURMA_ALUNO_ID")));
				avaliacao.setEntrega(entregaDAO.selectEntrega(rs.getInt("AV.ENTREGA_ID")));
				lista.add(avaliacao);
			} 
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Erro: " + e);
		}
		return lista;
	}
	
}