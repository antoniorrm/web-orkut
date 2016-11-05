package br.ufc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.dao.UsuarioDAOHibernate;
import br.ufc.excecoes.LoginException;
import br.ufc.interfaces.IUsuarioDAO;
import br.ufc.model.Usuario;

@Transactional
@Controller
public class LoginController {
	
	@Autowired
	@Qualifier(value = "usuarioDAOHibernate")
	private IUsuarioDAO usuarioDAO;
	
	@RequestMapping("homelogin")
	public String loginFormulario(){
		return "../../index";
	}
	
	@RequestMapping("/login") //usuario vem do form
	public String login(Usuario usuario, HttpSession session){
		Usuario u;
		try {
			u = usuarioDAO.recuperar(usuario.getLogin(), UsuarioDAOHibernate.md5(usuario.getSenha()));
			if(u != null){
				session.setAttribute("usuario_logado", u);
				return "redirect:home";
			}
			return "redirect:homelogin";
		} catch (LoginException e) {
			return e.getMessage();
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:homelogin";
	}
}
