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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import br.ufc.interfaces.IAlbumDAO;
import br.ufc.model.Album;
import br.ufc.model.Foto;
import br.ufc.model.Usuario;
import br.ufc.util.AulaFileUtil;

@Transactional
@Controller
public class AlbumController {

	@Autowired
	@Qualifier(value = "albumDAOHibernate")
	private IAlbumDAO albumDAO;
	
	@Autowired
	private ServletContext context;

	
	@RequestMapping("/addAlbumFormulario")
	public String addAlbumFormulario(HttpSession session, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		List<Album> albuns= (List<Album>) usuario.getAlbuns();
		String albumvaziahtml = "<p class='text-empty'>Nenhum album encontrado.</p>"; 
		if (albuns.isEmpty()) {
			model.addAttribute("album", albumvaziahtml);
		}
		model.addAttribute("albuns", albuns);
		model.addAttribute("usuario", usuario);
		return "album/add_album";
	}

	@RequestMapping("/addAlbum")
	public String addAlbum(HttpSession session, Album album,
			@RequestParam(value = "imagem", required = false) MultipartFile image) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		if (image != null && !image.isEmpty()) {
			String path = context.getRealPath("/");
			path += "resources/images/" + image.getOriginalFilename();
			AulaFileUtil.saveFile(path, image);
		}		
		album.setUsu_id(usuario.getUsu_id());
		album.setUsuario(usuario);
		album.setFoto_capa(image.getOriginalFilename());
		this.albumDAO.add(album);
		usuario.getAlbuns().add(album);		
		return "redirect:home";
	}
	@RequestMapping("/mostrarFotosAlbum")
	public String mostrarFotosAlbum	(HttpSession session, 
			HttpServletRequest request, Model model) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		int albu_id = Integer.parseInt(request.getParameter("id"));
		Album album = albumDAO.recuperar((long) albu_id);
		Set<Foto> fotos= album.getFotos();
		String fotovaziahtml = "<p class='text-empty'>Nenhuma foto encontrada.</p>"; 
		if (fotos.isEmpty()) {
			model.addAttribute("foto", fotovaziahtml);
		}
		model.addAttribute("fotos", fotos);
		model.addAttribute("album", album);
		model.addAttribute("usuario", usuario);
		return "foto/fotos_album";
	}	
	
}
