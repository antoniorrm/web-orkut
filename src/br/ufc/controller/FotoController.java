package br.ufc.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.interfaces.IAlbumDAO;
import br.ufc.interfaces.IFotoDAO;
import br.ufc.model.Album;
import br.ufc.model.Foto;
import br.ufc.model.Usuario;
import br.ufc.util.AulaFileUtil;

@Transactional
@Controller
public class FotoController {
	
	@Autowired
	@Qualifier(value = "fotoDAOHibernate")
	private IFotoDAO fotoDAO;
	
	@Autowired
	@Qualifier(value = "albumDAOHibernate")
	private IAlbumDAO albumDAO;
	

	@Autowired
	private ServletContext context;

	@RequestMapping("/addFoto")
	public String addAlbum(HttpSession session, Long id, Foto foto,
			@RequestParam(value = "image", required = false) MultipartFile image) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Album album = albumDAO.recuperar(id);
		if (image != null && !image.isEmpty()) {
			String path = context.getRealPath("/");
			path += "resources/images/" + image.getOriginalFilename();
			AulaFileUtil.saveFile(path, image);
		}
		foto.setAlbu_id(album.getAlbu_id());
		foto.setAlbum(album);
		foto.setImagem(image.getOriginalFilename());
		this.fotoDAO.add(foto);
		album.getFotos().add(foto);
		return "redirect:mostrarFotosAlbum?id="+album.getAlbu_id();
	}

}
