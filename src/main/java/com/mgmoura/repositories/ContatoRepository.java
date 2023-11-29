package com.mgmoura.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mgmoura.dtos.ContatoDto;
import com.mgmoura.entities.Contato;

public class ContatoRepository {
	
	private JdbcTemplate jdbcTemplate;
	
	public ContatoRepository(DataSource dataSource) {		
		jdbcTemplate = new JdbcTemplate(dataSource);		
	}
	
	public void create(ContatoDto contato) throws Exception {
		
		String sql = "insert into contato(nome, email, telefone) values(?, ?, ?) ";
		
		Object[] params = {
			contato.getNome(),
			contato.getEmail(),
			contato.getTelefone()
		};
		jdbcTemplate.update(sql, params);
	}
	
	
	public void update(Contato contato) throws Exception {
		
		String sql = "update contato set nome=?, email=?, telefone=? where idcontato=? ";
		
		Object[] params = {
				contato.getNome(),
				contato.getEmail(),
				contato.getTelefone(),
				contato.getIdContato()
			};
		
		jdbcTemplate.update(sql, params);
	}
	
	
		public List<Contato> find(String nome) throws Exception {	

			//String sql = "SELECT * FROM contato WHERE nome LIKE ? ORDER BY nome";
			String sql = "SELECT * FROM contato WHERE lower(nome) LIKE ?";

	    Object[] params = { "%" + nome.toLowerCase() + "%" };
		
		List<Contato> resultado = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {

			@Override
			public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Contato contato = new Contato();
				
				contato.setIdContato(rs.getInt("idContato"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
						
				return contato;
			}
			
		});
		return resultado;
	}
	
	
	public void delete(Integer idContato) throws Exception {
		
		String sql = "delete from contato where idcontato = ?";
		
		Object[] params = { idContato };
		
		jdbcTemplate.update(sql, params);
	}
	
	
	public Contato findById(Integer idContato) throws Exception {
		
		String sql = "select * from contato where idContato = ?";  
		
		Object[] params = { idContato };		
		
		List<Contato> resultado = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {

			@Override
			public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Contato contato = new Contato();
				
				contato.setIdContato(rs.getInt("idcontato"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				
				return contato;
			}
		});
		
		if(resultado.size() == 1 )
			return resultado.get(0);
		
		else
		
		return null;
	}
	

	// testar ao abrir a pagina
	public List<Contato> findAll(String nome) throws Exception {	

		String sql = "SELECT idContato, nome, email, telefone FROM contato order by nome";

    Object[] params = { nome };
	
	List<Contato> resultado = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {

		@Override
		public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			Contato contato = new Contato();
			
			contato.setIdContato(rs.getInt("idContato"));
			contato.setNome(rs.getString("nome"));
			contato.setEmail(rs.getString("email"));
			contato.setTelefone(rs.getString("telefone"));
					
			return contato;
		}
		
	});
	return resultado;
}
	
	
}








