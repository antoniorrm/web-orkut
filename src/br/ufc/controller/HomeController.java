package br.ufc.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.interfaces.IUsuarioDAO;
import br.ufc.model.Comunidade;
import br.ufc.model.Usuario;

@Transactional
@Controller
public class HomeController {
	
	@Autowired
	@Qualifier(value = "usuarioDAOHibernate")
	private IUsuarioDAO usuarioDAO;
	
	@Autowired
	private ServletContext context;
	

	@RequestMapping("/home")
	public String menu(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Comunidade> comunidades= usuario.getComunidades();
		String cvaziahtml = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhuma comunidade encontrada.</p></div>"; 
		if (comunidades.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		model.addAttribute("comunidades", comunidades);
		model.addAttribute("usuario", usuario);
		return "home";
	}
	
	
	
	
}
