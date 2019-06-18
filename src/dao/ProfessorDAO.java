package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConnectionFactory;
import model.Professor;
import model.Usuario;

public class ProfessorDAO extends UsuarioDAO {

	/**
	 * CRUD: Insere professor
	 * 
	 * @param conn: Connection
	 * @throws SQLException 
	 */
	public boolean create(Professor professor) throws SQLException {
		Connection conn = new ConnectionFactory().getConnection();

		Usuario usuario = createUsuario(professor);

		String sqlComand = "INSERT INTO Professor (professor_id, matricula, administrador) VALUES (?, ?, ?)";

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			System.out.println(usuario.getId());
			stm.setInt(1, usuario.getId());
			stm.setString(2, professor.getMatricula());
			stm.setInt(3, professor.getAdministrador());
			stm.executeUpdate();
			return true;
		} catch (SQLException ex) {
			return false;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	/**
	 * CRUD: Carrega dados do professor
	 */
	public Professor load(int id) {
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT professor.matricula, professor.administrador, "
				+ "usuario.id, usuario.nome, usuario.email, usuario.senha " + "FROM Professor as professor "
				+ "INNER JOIN Usuario as usuario ON usuario.Id = professor.professor_id " + "WHERE usuario.id = ?";

		Professor professor = null;

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {

			stm.setInt(1, id);

			ResultSet rs = stm.executeQuery();

			if (rs.next()) {
				String email = rs.getString("usuario.email");
				String senha = rs.getString("usuario.senha");

				professor = new Professor(email, senha);

				professor.setId(rs.getInt("usuario.id"));
				professor.setNome(rs.getString("usuario.nome"));
				professor.setMatricula(rs.getString("professor.matricula"));
				professor.setAdministrador(rs.getInt("professor.administrador"));
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

		return professor;
	}

	public ArrayList<Professor> findAll() {
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT  professor.matricula, professor.administrador, \r\n"
				+ "							usuario.id, usuario.nome, usuario.email, usuario.senha \r\n"
				+ "		           			FROM Professor as professor \r\n"
				+ "		           			INNER JOIN Usuario as usuario ON usuario.Id = professor.professor_id";

		Professor professor = null;
		ArrayList<Professor> prof = new ArrayList<>();
		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {

			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				String email = rs.getString("usuario.email");
				String senha = rs.getString("usuario.senha");

				professor = new Professor(email, senha);

				professor.setId(rs.getInt("usuario.id"));
				professor.setNome(rs.getString("usuario.nome"));
				professor.setMatricula(rs.getString("professor.matricula"));
				professor.setAdministrador(rs.getInt("professor.administrador"));
				prof.add(professor);
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

		return prof;
	}

	public ArrayList<Professor> findAllName(String nome) {
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "SELECT professor.matricula, professor.administrador,usuario.id, usuario.nome, "
				+ "usuario.email, usuario.senha FROM Professor as professor "
				+ "INNER JOIN Usuario as usuario ON usuario.Id = professor.professor_id "
				+ "WHERE usuario.nome  like ? ";

		Professor professor = null;
		ArrayList<Professor> prof = new ArrayList<>();
		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setString(1, "%" + nome + "%");
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				String email = rs.getString("usuario.email");
				String senha = rs.getString("usuario.senha");

				professor = new Professor(email, senha);

				professor.setId(rs.getInt("usuario.id"));
				professor.setNome(rs.getString("usuario.nome"));
				professor.setMatricula(rs.getString("professor.matricula"));
				professor.setAdministrador(rs.getInt("professor.administrador"));
				prof.add(professor);
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

		return prof;
	}

	/**
	 * CRUD: Atualiza dados do professor
	 */
	public void update(Professor professor) {
		Connection conn = new ConnectionFactory().getConnection();

		updateUsuario(professor);

		String sqlComand = "UPDATE Professor SET administrador = ?, matricula = ? WHERE professor_id = ?";

		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setInt(1, professor.getAdministrador());
			stm.setString(2, professor.getMatricula());
			stm.setInt(3, professor.getId());

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

	/**
	 * CRUD: Deleta professor
	 * 
	 * @param conn: Connection
	 * @throws SQLException
	 */
	public void delete(int id) throws SQLException {
		Connection conn = new ConnectionFactory().getConnection();

		String sqlComand = "DELETE FROM Professor WHERE professor_id = ?";
		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setInt(1, id);
			stm.executeUpdate();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		deleteUsuario(id);
	}
}
