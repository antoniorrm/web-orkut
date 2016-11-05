package br.ufc.controller;

import java.io.File;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.ServletContext;
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

	// LISTAR
	@RequestMapping("/listarUsuario")
	public String listarUsuario(Model model) {
		List<Usuario> usuarios = usuarioDAO.listar();
		model.addAttribute("usuarios", usuarios);
		return "usuarios/listar_usuario";
	}

	@RequestMapping("/home")
	public String menu(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		model.addAttribute("usuario", usuario);
		return "home";
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

	@RequestMapping("/inserirAmizadeFormulario")
	public String inserirAmizadeFormulario(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Usuario> potenciaisAmigos = usuarioDAO.listar();
		potenciaisAmigos.remove(usuario);

//		AmizadeCheckboxForm acf = new AmizadeCheckboxForm();
		List<Amizade> minhasAmizades = this.amizadeDAO.listarAmizadesDeId(usuario.getUsu_id());
		 
		 if(minhasAmizades != null && minhasAmizades.size() > 0){
			 
			 //Long[] vetorIds = new Long[minhasAmizades.size()];
			 //int i = 0;
			 for(Amizade amizade : minhasAmizades){
				 Long amigoId = amizade.getUsuarioAlvo().getUsu_id();
				 Usuario amigoTmp = new Usuario();
				 amigoTmp.setUsu_id(amigoId);
				 potenciaisAmigos.remove(amigoTmp);
				 
//				 vetorIds[i] = amigoId;
//				 i++;
			 }
//			 acf.setAmigos(vetorIds);
		 }

		model.addAttribute("usuario", usuario);
		model.addAttribute("potenciais_amigos", potenciaisAmigos);
//		model.addAttribute("amizade", acf);

		return "usuarios/inserir_amizade_formulario";
	}

//	@RequestMapping("/inserirAmizade")
//	public String inserirAmizade(HttpSession session, AmizadeCheckboxForm amizades) {
//		Usuario amigoFonte = (Usuario) session.getAttribute("usuario_logado");
//		for (Long id : amizades.getAmigos()) {
//			Usuario amigoAlvo = usuarioDAO.recuperar(id);
//			Amizade amigo = new Amizade();
//			amigo.setUsuarioFonte(amigoFonte);
//			amigo.setUsuarioAlvo(amigoAlvo);
//			amizadeDAO.inserir(amigo);
//		}
//		return "redirect:listarUsuario";
//	}

}
