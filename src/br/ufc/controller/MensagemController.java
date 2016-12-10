package br.ufc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.interfaces.IComunidadeDAO;
import br.ufc.interfaces.IForumDAO;
import br.ufc.interfaces.IMensagemDAO;
import br.ufc.model.Comunidade;
import br.ufc.model.Forum;
import br.ufc.model.Mensagem;
import br.ufc.model.Usuario;

@Transactional
@Controller	
public class MensagemController {
	@Autowired
	@Qualifier(value = "comunidadeDAOHibernate")
	private IComunidadeDAO comunidadeDAO;
	
	@Autowired
	@Qualifier(value = "forumDAOHibernate")
	private IForumDAO forumDAO;
	
	@Autowired
	@Qualifier(value = "mensagemDAOHibernate")
	private IMensagemDAO mensagemDAO;
	
	@RequestMapping("/addMensagemFormulario")
	public String addMensagemFormulario(HttpSession session, HttpServletRequest request, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long for_id = Long.parseLong(request.getParameter("for_id"));
		Forum forum = forumDAO.recuperar(for_id);
		Comunidade comunidade = comunidadeDAO.recuperar(forum.getCom_id());
		model.addAttribute("comunidade", comunidade);
		model.addAttribute("usuario", usuario);
		model.addAttribute("forum", forum);
		return "forum/add_mensagem";
	}
	
	@RequestMapping("/addMensagem")
	public String addMensagem(HttpSession session, HttpServletRequest request, Mensagem mensagem){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long for_id = Long.parseLong(request.getParameter("for_id"));
		Forum forum = forumDAO.recuperar(for_id);
		mensagem.setUsuario(usuario);
		mensagem.setForum(forum);
		forum.getMensagens().add(mensagem);
		mensagemDAO.add(mensagem);
		return "redirect:homeforum?for_id="+forum.getFor_id();
	}
}
