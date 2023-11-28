package com.mgmoura.controllers;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mgmoura.entities.Contato;
import com.mgmoura.repositories.ContatoRepository;

@Controller
public class ContatosConsultaController {

	@Autowired
	ContatoRepository contatoRepository;

	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("contatos-consulta");



		return modelAndView;
	}

	@RequestMapping(value = "/contatos-consulta-post", method = RequestMethod.POST)
	public ModelAndView contatosConsultaPost(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("contatos-consulta");

		try {

			String nome = request.getParameter("nome");

			List<Contato> contatos = contatoRepository.find(nome);

			if (contatos.size() > 0) {
				modelAndView.addObject("lista_contatos", contatos);

			} else {
				modelAndView.addObject("mensagem_atencao", "Nenhum contato localizado");
			}

			modelAndView.addObject("nome", nome);

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}

		return modelAndView;
	}

	@RequestMapping(value = "contatos-excluir")
	public ModelAndView contatosExcluir(Integer idContato) {

		ModelAndView modelAndView = new ModelAndView("contatos-consulta");

		try {

			Contato contato = contatoRepository.findById(idContato);
			contatoRepository.delete(idContato);

			modelAndView.addObject("mensagem", "Contato excluído.");

			List<Contato> contatos = contatoRepository.find(contato.getNome());
			modelAndView.addObject("contatos", contatos);

		} catch (Exception e) {
			modelAndView.addObject("mensagem", e.getMessage());
		}

		return modelAndView;
	}
}
