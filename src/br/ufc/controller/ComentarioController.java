package br.ufc.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.interfaces.IComentarioDAO;
import br.ufc.interfaces.IFotoDAO;
import br.ufc.model.Comentario;
import br.ufc.model.Foto;
import br.ufc.model.Usuario;

@Transactional
@Controller
public class ComentarioController {
	@Autowired
	@Qualifier(value = "fotoDAOHibernate")
	private IFotoDAO fotoDAO;
	@Autowired
	@Qualifier(value = "comentarioDAOHibernate")
	private IComentarioDAO comentarioDAO;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/addComentario")
	public String addComentario(HttpSession session, Long id, Comentario comentario) {
		Usuario usuario = (Usuario) session.getAttribute("usuario_logado");
		Foto foto =fotoDAO.recuperar(id);
		comentario.setFot_id(foto.getFot_id());
		comentario.setFoto(foto);
		comentario.setUsu_id(usuario.getUsu_id());
		comentario.setUsuario(usuario);
		Long cId =  this.comentarioDAO.add(comentario);
		comentario.setCom_id(cId);
		foto.getComentarios().add(comentario);	
		usuario.getComentarios().add(comentario);	
		return "redirect:fotoDetalhe?idf="+foto.getFot_id()+"&ida="+foto.getAlbu_id();
	}
}
