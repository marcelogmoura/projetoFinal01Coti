package com.mgmoura.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgmoura.entities.Contato;
import com.mgmoura.repositories.ContatoRepository;

@Controller
public class ContatosEdicaoController {
	
	@Autowired
	private ContatoRepository contatoRepository;
	
	@RequestMapping(value="/contatos-edicao")
	public ModelAndView contatosEdicao(Integer idContato , HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("contatos-edicao");
		
		try {
			
			Contato contato =  contatoRepository.findById(idContato);
			
			if(contato != null) {
				
				modelAndView.addObject("nome" , contato.getNome());
				modelAndView.addObject("email" , contato.getEmail());
				modelAndView.addObject("telefone" , contato.getTelefone());
				
			}else {
				modelAndView.setViewName("redirect:/");
			}
			// modelAndView.addObject("contato" , contato);	
			
		}catch (Exception e) {
			modelAndView.addObject("mensagem_erro" , e.getMessage());
		}		
		
		return modelAndView;
	}
	
	@RequestMapping(value="/contatos-edicao-post" , method = RequestMethod.POST)
	public ModelAndView contatosEdicaoPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("contatos-consulta");
		
		try {
			
			Contato contato = new Contato();
			
			contato.setIdContato(Integer.parseInt(request.getParameter("idContato")));
			contato.setNome(request.getParameter("nome"));
			contato.setEmail(request.getParameter("email"));
			contato.setTelefone(request.getParameter("telefone"));
			
			contatoRepository.update(contato);
			
			modelAndView.addObject("mensagem" , "Contato atualizado.");
			
		}catch (Exception e) {
			modelAndView.addObject("mensagem_erro" , e.getMessage());
		}
		
		return modelAndView;
		
	}

}


