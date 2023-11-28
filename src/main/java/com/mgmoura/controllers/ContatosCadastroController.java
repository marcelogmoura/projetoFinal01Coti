package com.mgmoura.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgmoura.dtos.ContatoDto;
import com.mgmoura.entities.Contato;
import com.mgmoura.repositories.ContatoRepository;

@Controller
public class ContatosCadastroController {
	
	@Autowired
	ContatoRepository contatoRepository;
	
	@RequestMapping(value="/contatos-cadastro")
	public ModelAndView test(HttpServletResponse response) {
		
		ModelAndView modelAndView = new ModelAndView("contatos-cadastro");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/contatos-cadastro-post" , method = RequestMethod.POST)
	public ModelAndView contatoCadastroPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("contatos-cadastro");
		
		try {
			
			ContatoDto dto = new ContatoDto();
			
			dto.setIdContato(dto.getIdContato());
			dto.setNome(request.getParameter("nome"));
			dto.setEmail(request.getParameter("email"));
			dto.setTelefone(request.getParameter("telefone"));
			
			contatoRepository.create(dto);
			
			modelAndView.addObject("mensagem" , "Contato cadastrado.");
			
		
			
		}catch (Exception e) {
			modelAndView.addObject("mensagem" , "Erro: " + e.getMessage());
		}
		
		return modelAndView;
	}
}



