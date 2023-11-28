package com.mgmoura.dtos;

import lombok.Data;

@Data
public class ContatoDto {
	
	private Integer idContato;
	private String nome;
	private String email;
	private String telefone;

}
