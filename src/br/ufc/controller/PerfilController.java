package br.ufc.controller;

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

import br.ufc.interfaces.IAlbumDAO;
import br.ufc.interfaces.IAmizadeDAO;
import br.ufc.interfaces.IUsuarioDAO;
import br.ufc.model.Album;
import br.ufc.model.Foto;
import br.ufc.model.Usuario;

@Transactional
@Controller
public class PerfilController {

	@Autowired
	@Qualifier(value = "usuarioDAOHibernate")
	private IUsuarioDAO usuarioDAO;

	@Autowired
	@Qualifier(value = "amizadeDAOHibernate")
	private IAmizadeDAO amizadeDAO;

	@Autowired
	@Qualifier(value = "albumDAOHibernate")
	private IAlbumDAO albumDAO;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/album")
	public String Album(HttpSession session, HttpServletRequest request, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Long usu_id = Long.parseLong(request.getParameter("usu_id"));
		Usuario amigo = usuarioDAO.recuperar(usu_id);
		List<Album> albuns= (List<Album>) amigo.getAlbuns();
		String albumvaziahtml = "<p class='text-empty'>Nenhum album encontrado.</p>"; 
		if (albuns.isEmpty()) {
			model.addAttribute("album", albumvaziahtml);
		}
		model.addAttribute("albuns", albuns);
		model.addAttribute("usuario", usuario);
		model.addAttribute("amigo", amigo);
		return "album/album";
	}
	
	@RequestMapping("/foto")
	public String Fotos(HttpSession session, 
			HttpServletRequest request, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		int albu_id = Integer.parseInt(request.getParameter("id"));
		Album album = albumDAO.recuperar((long) albu_id);
		Usuario amigo = usuarioDAO.recuperar(album.getUsu_id());
		Set<Foto> fotos= album.getFotos();
		String fotovaziahtml = "<p class='text-empty'>Nenhuma foto encontrada.</p>"; 
		if (fotos.isEmpty()) {
			model.addAttribute("foto", fotovaziahtml);
		}
		model.addAttribute("fotos", fotos);
		model.addAttribute("album", album);
		model.addAttribute("amigo", amigo);
		model.addAttribute("usuario", usuario);
		return "foto/foto";
	}
	
}
