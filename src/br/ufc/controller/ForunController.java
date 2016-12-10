package br.ufc.controller;

import java.util.HashSet;
import java.util.Set;

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
import br.ufc.model.Categoria;
import br.ufc.model.Comunidade;
import br.ufc.model.Forum;
import br.ufc.model.Mensagem;
import br.ufc.model.Usuario;

@Transactional
@Controller
public class ForunController {
	
	@Autowired
	@Qualifier(value = "comunidadeDAOHibernate")
	private IComunidadeDAO comunidadeDAO;
	
	@Autowired
	@Qualifier(value = "forumDAOHibernate")
	private IForumDAO forumDAO;
	
	@Autowired
	@Qualifier(value = "mensagemDAOHibernate")
	private IMensagemDAO mensagemDAO;
	
	@RequestMapping("/addForumFormulario")
	public String addForumFormulario(HttpSession session, HttpServletRequest request, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long com_id = Long.parseLong(request.getParameter("com_id"));
		Comunidade comunidade = comunidadeDAO.recuperar(com_id);
		model.addAttribute("comunidade", comunidade);
		model.addAttribute("usuario", usuario);
		return "forum/add_forum";
	}
	
	
	@RequestMapping("/addForum")
	public String addForum(HttpSession session, Forum forum, String mensagem){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Comunidade comunidade = comunidadeDAO.recuperar(forum.getCom_id());
		forum.setComunidade(comunidade);
		Set<Mensagem> mensagens = new HashSet<Mensagem>();
		forum.setMensagens(mensagens);		
		forumDAO.add(forum);
		comunidade.getForuns().add(forum);
		Mensagem m = new Mensagem();
		m.setTexto(mensagem);
		m.setUsuario(usuario);
		m.setForum(forum);
		forum.getMensagens().add(m);
		mensagemDAO.add(m);
		return "redirect:homeforum?for_id="+forum.getFor_id();
	}
	
	@RequestMapping("/homeforum")
	public String homeforum(HttpSession session, HttpServletRequest request, Model model){
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long for_id = Long.parseLong(request.getParameter("for_id"));
		Forum forum = forumDAO.recuperar(for_id);
		Comunidade comunidade = comunidadeDAO.recuperar(forum.getCom_id());
		Set<Mensagem> mensagens = forum.getMensagens();
		
		model.addAttribute("forum", forum);
		model.addAttribute("usuario", usuario);
		model.addAttribute("comunidade", comunidade);
		model.addAttribute("mensagens", mensagens);
		return "forum/home_forum";
	}

}
