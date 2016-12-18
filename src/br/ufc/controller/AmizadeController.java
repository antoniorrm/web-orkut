package br.ufc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.interfaces.IAmizadeDAO;
import br.ufc.interfaces.IUsuarioDAO;
import br.ufc.model.Amizade;
import br.ufc.model.Usuario;

@Controller
@Transactional
public class AmizadeController {

	@Autowired
	@Qualifier(value = "usuarioDAOHibernate")
	private IUsuarioDAO usuarioDAO;

	@Autowired
	@Qualifier(value = "amizadeDAOHibernate")
	private IAmizadeDAO amizadeDAO;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/addAmizade")
	public String inserirAmizade(HttpSession session, HttpServletRequest request) {
		Usuario amigoFonte = (Usuario) session.getAttribute("usuario_logado");
		Long a = Long.parseLong(request.getParameter("amigo"));
		Usuario amigoAlvo = usuarioDAO.recuperar(a);
		Amizade amigo = new Amizade();
		amigo.setUsuarioFonte(amigoFonte);
		amigo.setUsuarioAlvo(amigoAlvo);
		amizadeDAO.inserir(amigo);
		amigoFonte.getAmizades().add(amigo);
		return "redirect:perfilUsuario?usu_id=" + a;
	}
	
	@RequestMapping("/inserirAmizadeFormulario")
	public String inserirAmizadeFormulario(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Usuario> potenciaisAmigos = usuarioDAO.listar();
		potenciaisAmigos.remove(usuario);

		// AmizadeCheckboxForm acf = new AmizadeCheckboxForm();
		List<Amizade> minhasAmizades = this.amizadeDAO.listarAmizadesDeId(usuario.getUsu_id());

		if (minhasAmizades != null && minhasAmizades.size() > 0) {

			// Long[] vetorIds = new Long[minhasAmizades.size()];
			// int i = 0;
			for (Amizade amizade : minhasAmizades) {
				Long amigoId = amizade.getUsuarioAlvo().getUsu_id();
				Usuario amigoTmp = new Usuario();
				amigoTmp.setUsu_id(amigoId);
				potenciaisAmigos.remove(amigoTmp);

				// vetorIds[i] = amigoId;
				// i++;
			}
			// acf.setAmigos(vetorIds);
		}

		model.addAttribute("usuario", usuario);
		model.addAttribute("potenciais_amigos", potenciaisAmigos);
		// model.addAttribute("amizade", acf);

		return "usuarios/inserir_amizade_formulario";
	}
	
	@RequestMapping("/amigos")
	public String amigos(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Usuario> amigos = new ArrayList();
		for (Amizade a : usuario.getAmizades()) {
			amigos.add(a.getUsuarioAlvo());
		}
		String cvaziahtml = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhuma comunidade encontrada.</p></div>";
		if (amigos.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		model.addAttribute("usuario", usuario);
		model.addAttribute("amigos", amigos);
		return "perfil/amigos";
	}

}
