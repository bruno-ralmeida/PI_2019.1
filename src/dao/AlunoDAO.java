package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import connection.ConnectionFactory;
import model.Aluno;
import model.Usuario;

public class AlunoDAO extends UsuarioDAO {
	
	/**
     * CRUD: Insere aluno
     */
	public void create(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		Usuario usuario = createUsuario(aluno);
		
		String sqlComand = "INSERT INTO Aluno (aluno_id, ra) VALUES (?, ?)";
		
		try(PreparedStatement stmt = conn.prepareStatement(sqlComand);){
			System.out.println(usuario.getId());
			stmt.setInt(1, usuario.getId());
			stmt.setString(2, aluno.getRa());
			
			stmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
     * CRUD: Carrega dados do aluno
     */
	public Aluno load(int id) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT aluno.ra, usuario.id, usuario.nome, usuario.email, usuario.senha " + 
		           			"FROM Aluno as aluno " + 
		           			"INNER JOIN Usuario as usuario ON usuario.Id = aluno.aluno_id " + 
		           			"WHERE usuario.id = ?";
		
		Aluno aluno = null;
		try(PreparedStatement stmt = conn.prepareStatement(sqlComand);){
			
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
            if(rs.next()) {
            	String email = rs.getString("usuario.email");
            	String senha = rs.getString("usuario.senha");
            	
            	aluno = new Aluno(email, senha);
            	
            	aluno.setId(rs.getInt("usuario.id"));
            	aluno.setNome(rs.getString("usuario.nome"));
            	aluno.setRa(rs.getString("aluno.ra"));
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
		
		return aluno;
	}
	
	/**
     * CRUD: Atualiza dados do aluno
     */
	public void update(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		//Atualiza email e senha
		updateUsuario(aluno);
		
		String sqlComand = "UPDATE Aluno SET ra = ? WHERE aluno_id = ?";
		
		try(PreparedStatement stmt = conn.prepareStatement(sqlComand);){
			stmt.setString(1, aluno.getRa());
			stmt.setInt(2, aluno.getId());
			
			stmt.executeUpdate();            
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
     * CRUD: Excluir usuário
     */
	public void delete(int id) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "DELETE FROM Aluno WHERE aluno_id = ?";
		try(PreparedStatement stmt = conn.prepareStatement(sqlComand);){
			stmt.setInt(1, id);
			stmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		deleteUsuario(id);
	}

}
