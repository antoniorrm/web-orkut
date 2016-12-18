package br.ufc.controller;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.dao.UsuarioDAOHibernate;
import br.ufc.excecoes.LoginException;
import br.ufc.interfaces.IAmizadeDAO;
import br.ufc.interfaces.IUsuarioDAO;
import br.ufc.model.Amizade;
import br.ufc.model.Comunidade;
import br.ufc.model.Usuario;
import br.ufc.util.AulaFileUtil;

@Controller
@Transactional
public class UsuarioController {

	@Autowired
	@Qualifier(value = "usuarioDAOHibernate")
	private IUsuarioDAO usuarioDAO;

	@Autowired
	@Qualifier(value = "amizadeDAOHibernate")
	private IAmizadeDAO amizadeDAO;

	@Autowired
	private ServletContext context;

	@RequestMapping("/inserirUsuarioFormulario")
	public String inserirUsuarioFormulario() {
		return "usuarios/inserir_usuario_formulario";
	}

	@RequestMapping("/inserirUsuario")
	public String inserirUsuario(Usuario usuario,
			@RequestParam(value = "imagem", required = false) MultipartFile image) {
		if (image != null && !image.isEmpty()) {
			String path = context.getRealPath("/");
			path += "resources/images/" + image.getOriginalFilename();
			usuario.setAvatar(image.getOriginalFilename());
			try {
				usuario.setSenha(UsuarioDAOHibernate.md5(usuario.getSenha()));
			} catch (LoginException e) {
				System.out.println(e.getMessage());
			}
			AulaFileUtil.saveFile(path, image);
		}
		this.usuarioDAO.inserir(usuario);
		return "redirect:homelogin";
	}

	// BUSCAR
	@RequestMapping("/buscarUsuario")
	public String buscarUsuario(HttpSession session, String txt, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Usuario> resultado = usuarioDAO.recuperar(txt, usuario.getUsu_id());
		for (Amizade a : usuario.getAmizades()) {
			resultado.remove(a.getUsuarioAlvo());
		}
		String cvaziahtml = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhum usuario encontrada.</p></div>";
		if (resultado.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		model.addAttribute("usuario", usuario);
		model.addAttribute("txt", txt);
		model.addAttribute("usuarios", resultado);
		return "buscar/perfil";
	}

	// Perfil
	@RequestMapping("/perfilUsuario")
	public String perfilUsuario(HttpSession session, HttpServletRequest request, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long usu_id = Long.parseLong(request.getParameter("usu_id"));
		if (usu_id == usuario.getUsu_id()) {
			return "redirect:home";
		}
		Usuario amigo = usuarioDAO.recuperar(usu_id);
		String html = "<p><a href='addAmizade?amigo=" + usu_id
				+ "' class=\"icone icon-usuario-adicionar\">+ amigo</a></p>";
		//verifico se já existe amizade
		Amizade verificar = new Amizade();
		verificar.setUsuarioAlvo(amigo);
		verificar.setUsuarioFonte(usuario);
		if (!amizadeDAO.existeAmizade(verificar)) {
			model.addAttribute("add", html);
		}
		Set<Usuario> amigos = new HashSet<Usuario>();
		for (Amizade a : amigo.getAmizades()) {
			amigos.add(a.getUsuarioAlvo());
		}
		
		Set<Comunidade> comunidades = amigo.getComunidades();
		String cvaziahtml = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhuma comunidade encontrada.</p></div>";
		if (comunidades.isEmpty()) {
			model.addAttribute("html", cvaziahtml);
		}
		String cvaziahtmla = "<div class='col-xs-12 col-sm-12 col-lg-12 nopadding'><p class='text-empty'>Nenhuma amigo encontrada.</p></div>";
		if (amigos.isEmpty()) {
			model.addAttribute("htmla", cvaziahtmla);
		}
		model.addAttribute("comunidades", comunidades);
		model.addAttribute("usuario", usuario);
		model.addAttribute("amigo", amigo);
		model.addAttribute("amigos", amigos);
		return "perfil/perfil_usuario";
	}
	
	
	

/*	// LISTAR
	@RequestMapping("/listarUsuario")
	public String listarUsuario(Model model) {
		List<Usuario> usuarios = usuarioDAO.listar();
		model.addAttribute("usuarios", usuarios);
		return "usuarios/listar_usuario";
	}

	// Apagar
	@RequestMapping("/apagarUsuario")
	public String apagarUsuario(Long id) {
		usuarioDAO.apagar(id);
		return "redirect:listarUsuario";
	}

	// Alterar
	@RequestMapping("/alterarUsuarioFormulario")
	public String alterarUsuarioFormulario(Long id, Model model) {
		Usuario u = usuarioDAO.recuperar(id);
		model.addAttribute("usuario", u);
		return "usuarios/alterar_usuario_formulario";
	}

	@RequestMapping("/alterarUsuario")
	public String alterarUsuario(Usuario u, @RequestParam(value = "image", required = false) MultipartFile image) {
		if (image != null && !image.isEmpty()) {
			String path = context.getRealPath("/");
			path += "resources/images/" + u.getLogin() + ".png";
			AulaFileUtil.deleteFile(path);

			AulaFileUtil.saveFile(path, image);
		}
		usuarioDAO.alterar(u);
		return "redirect:listarUsuario";
	}
*/
}
