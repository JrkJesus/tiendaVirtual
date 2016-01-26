/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import tienda.*;

/**
 *
 * @author jesus
 */
@MultipartConfig()
@WebServlet(name = "Administrar",
        urlPatterns = {"/loguear",
            "/logout",
            "/validate_registrar",
            "/registrar",
            "/change_p",
            "/changePwd",
            "/change_e",
            "/changeEmail",
            "/nuevo_productos",
            "/filter",
            "/ver",
            "/verFav",
            "/verComentario",
            "/nuevo_comentario",
            "/addFav",
            "/changePerfil",
            "/change",
            "/addProducto"})
public class Administrar extends HttpServlet {

    @PersistenceContext(unitName = "JavaWebApp1PU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion;
        accion = request.getServletPath();
        String vista;
        TypedQuery<Usuario> query;
        TypedQuery<Productos> queryP;
        TypedQuery<Comentarios> queryC;
        List<Usuario> lr;
        List<Productos> lp;
        HttpSession session = request.getSession();
        
        switch (accion) {
            case "/loguear":
                // Obtener todas las intancias de la Entidad Roles a la Vista
                String email = request.getParameter("email");
                String pwd = request.getParameter("pwd");
                if (email != null && pwd != null) {
                    query = em.createNamedQuery("Usuario.loguear", Usuario.class);
                    query.setParameter("email", email);
                    query.setParameter("pwd", request.getParameter("pwd"));
                    lr = query.getResultList();

                    if (lr.isEmpty()) {
                        request.setAttribute("msg", "<div class= \"alert alert-danger\"> El usuario y la contraseña no coinciden </div>");
                        vista = "/login.jsp";
                    } else {
                        Date fech = new Date();
                        session.setAttribute("id", lr.get(0).getId());
                        session.setAttribute("name", lr.get(0).getNombre());
                        session.setAttribute("fecha", "Ultima conexion: "+fech.toString());
                        vista = "/index.jsp";
                    }
                } else {
                    vista = "/login.jsp";
                    request.setAttribute("msg", "<div class= \"alert alert-danger\"> Campo vacio </div>");
                }
                break;
            case "/registrar":
                //
                vista = "/registrar.jsp";
                break;
            case "/validate_registrar":
                //
                String email_reg = request.getParameter("email");
                String pwd_reg = request.getParameter("pwd");
                int cp_reg = Integer.parseInt(request.getParameter("cp"));
                String name_reg = request.getParameter("name");
                String dir_reg = request.getParameter("dir");
                String twitter_reg = request.getParameter("twitter");
                String fb_reg = request.getParameter("fb");

                Usuario nuevo = new Usuario();
                nuevo.setEmail(email_reg);
                nuevo.setPwd(pwd_reg);
                nuevo.setNombre(name_reg);
                nuevo.setDir(dir_reg);
                nuevo.setCP(cp_reg);
                nuevo.setFb(fb_reg);
                nuevo.setTwitter(twitter_reg);

                String msg = "<div class= \"alert alert-success\"> Usuario Creado </div>";
                try {
                    persist(nuevo);
                } catch (Exception e) {
                    msg = "<div class= \"alert alert-danger\"> Error email ya registrado</div>";
                }
                request.setAttribute("msg", msg);
                vista = "/registrar";
                break;
            case "/logout":
                //
                session.invalidate();
                vista = "/index.jsp";
                break;
            case "/changePwd":
                vista = "/WEB-INF/admin/changePwd.jsp";
                break;
            case "/change_p":
                /// toDO: 
                Usuario u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));
                if (u_ch_p != null) {
                    if (u_ch_p.getPwd().equals(request.getParameter("o_pwd"))) {
                        u_ch_p.setPwd(request.getParameter("n_pwd"));
                        editar(u_ch_p);
                        msg = "<div class= \"alert alert-success\"> Contrasea cambiada</div>";
                    } else {
                        msg = "<div class= \"alert alert-danger\"> La contrasea es incorrecta</div>";
                    }
                } else {
                    msg = "<div class= \"alert alert-danger\"> La contrasea es incorrecta</div>";
                }
                request.setAttribute("msg", msg);
                vista = "/WEB-INF/admin/changePwd.jsp";
                break;
            case "/changeEmail":
                vista = "/WEB-INF/admin/changeEmail.jsp";
                break;
            case "/change_e":
                /// toDO: 
                u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));
                if (u_ch_p != null) {
                    if (u_ch_p.getEmail().equals(request.getParameter("o_email"))) {
                        u_ch_p.setEmail(request.getParameter("n_email"));
                        try {
                            msg = "<div class= \"alert alert-success\"> Email cambiada</div>";
                            editar(u_ch_p);
                        } catch (RuntimeException e) {
                            msg = "<div class= \"alert alert-danger\"> El email ya esta registrado</div>";
                        }
                    } else {
                        msg = "<div class= \"alert alert-danger\"> El email es incorrecta1</div>";
                    }
                } else {
                    msg = "<div class= \"alert alert-danger\"> El email es incorrecta2</div>";
                }
                request.setAttribute("msg", msg);
                vista = "/WEB-INF/admin/changeEmail.jsp";
                break;
            case "/addProducto":
                vista = "/WEB-INF/producto/addProducto.jsp";
                break;
            case "/nuevo_productos":
                Productos prod = new Productos();
                int cat_prod = Integer.parseInt(request.getParameter("categoria"));
                int est_prod = Integer.parseInt(request.getParameter("est"));
                int year_prod = Integer.parseInt(request.getParameter("year"));
                float precio_prod = Float.parseFloat(request.getParameter("precio"));
                String descrip_reg = request.getParameter("descrip");
                String name_prod = request.getParameter("Nombre");
                u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));

                prod.setCategoria(cat_prod);
                prod.setDescripcion(descrip_reg);
                prod.setEstado(est_prod);
                prod.setFechaAd(year_prod);
                prod.setNombre(name_prod);
                prod.setPrecio(precio_prod);
                prod.setVendedor(u_ch_p);

                msg = "<div class= \"alert alert-success\"> Usuario Creado </div>";
                try {
                    persist(prod);
                } catch (Exception e) {
                    msg = "<div class= \"alert alert-danger\"> Error email ya registrado</div>";
                }

                request.setAttribute("msg", msg);
                vista = "/WEB-INF/producto/addProducto.jsp";
                break;
            case "/filter":

                String cat = request.getParameter("cat");
                String id = request.getParameter("id");
                String pMayor = request.getParameter("pmayor");
                String pMenor = request.getParameter("pmenor");
                String cp = request.getParameter("cp");
                String where;

                if (id != null) 
                {
                    where = "id = " + id;
                    vista = "/WEB-INF/producto/show.jsp";
                    Productos p_fil = (Productos) em.find(Productos.class, Long.parseLong(id));
                    queryC = em.createQuery("SELECT r FROM Comentarios r WHERE r.tipo = 1 AND r.articulo.id = " + id, Comentarios.class);
                    List<Comentarios> lc = queryC.getResultList();
                    request.setAttribute("coments", lc);
                } 
                else 
                {
                    where = "id = r.id ";
                    vista = "/WEB-INF/producto/showAll.jsp";
                    if( cat != null && !cat.equals("0") && pMayor == null && pMenor == null && cp == null) 
                    {
                        where += " AND r.categoria = "+ Integer.parseInt(cat);
                    } 
                    else if(cat != null || pMayor != null || pMenor != null || cp != null)
                    {
                        vista = "/WEB-INF/include/ver_prod_fil.jsp";
                        if(cat != null && !cat.equals("0"))
                        {
                            where += " AND r.categoria = "+ Integer.parseInt(cat);
                        }
                        if(pMayor != null && !pMayor.equals(""))
                        {
                            where += " AND r.precio > " + Integer.parseInt(pMayor);
                        }
                        if(pMenor != null && !pMenor.equals(""))
                        {
                            where += " AND r.precio < " + Integer.parseInt(pMenor);
                        }
                        if(cp != null && !cp.equals(""))
                        {
                            where += " AND r.vendedor.CP = " + Integer.parseInt(cp);
                        }
                    }
                }
                queryP = em.createQuery("SELECT r FROM Productos r WHERE r." + where, Productos.class);
                lp = queryP.getResultList();

                if (lp.isEmpty()) {
                    request.setAttribute("msg", "<div class= \"alert alert-warning\"> Aun no hay productos </div>");
                }
                request.setAttribute("lista", lp);
                
                break;
            case "/verComentario":
                int idC = Integer.parseInt(request.getParameter("id"));
                queryC = em.createNamedQuery("Comentarios.ver", Comentarios.class);
                queryC.setParameter("id", idC);
                List<Comentarios> lc = queryC.getResultList();
                System.out.println(lc.isEmpty());
                request.setAttribute("lista", lc);
                vista = "/WEB-INF/include/ver_comen.jsp";
                System.out.println(session.getAttribute("id")==lc.get(0).getAutor().getId());
                break;
            case "/nuevo_comentario":
                Comentarios coment = new Comentarios();
                u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));
                coment.setComentar(request.getParameter("comen"));
                coment.setAutor(u_ch_p);
                coment.setTipo(Integer.parseInt(request.getParameter("tipoC")));
                id = request.getParameter("id");
                System.out.println(id);
                Long idP = Long.parseLong(id);
                Productos p_n_com = em.find(Productos.class, idP);
                coment.setArticulo(p_n_com);
                msg = "<div class= \"alert alert-success\"> Usuario Creado </div>";
                try {
                    persist(coment);
                } catch (Exception e) {
                    msg = "<div class= \"alert alert-danger\"> Error email ya registrado</div>";
                }
                vista = "filter?id=" + id;
                break;
            case "/addFav":
                id = request.getParameter("id");
                if (id != null) {
                    List<Productos> favP;
                    queryP = em.createNamedQuery("Productos.findById", Productos.class);
                    queryP.setParameter("id", Integer.parseInt(id));
                    lp = queryP.getResultList();
                    if (lp != null) { // Esta el artículo                        
                        if (session.getAttribute("fav") == null) {
                            favP = new ArrayList<>();
                        } else {
                            favP = (List<Productos>) session.getAttribute("fav");
                        }
                        Productos a = lp.get(0);
                        if (!favP.contains(a)) {
                            favP.add(a);
                        }
                        msg = "<div class= \"alert alert-success\"> Añadido a fav </div>";
                        session.setAttribute("fav", favP);
                    } else { //No está el art
                        msg = "<div class= \"alert alert-success\">Artículo registrado en favoritos. No existía.</div>";
                    }
                } else { // Id no enviado
                    msg = "<div class= \"alert alert-danger\">Artículo No registrado en favoritos. Falta Id.</div>";
                }

                request.setAttribute("msg", msg);
                queryP = em.createNamedQuery("Productos.findAll", Productos.class);

                lp = queryP.getResultList();
                request.setAttribute("lista", lp);
                vista = "/WEB-INF/producto/showFav.jsp";
                break;
            case "/verFav":
                vista = "/WEB-INF/producto/showFav.jsp";
                break;
            case "/changePerfil":
                u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));
                request.setAttribute("usuario", u_ch_p);
                vista = "/WEB-INF/admin/cambiarPerfil.jsp";
                break;
            case "/change":
                u_ch_p = em.find(Usuario.class, Long.parseLong(session.getAttribute("id").toString()));
                u_ch_p.setCP(Integer.parseInt(request.getParameter("cp")));
                u_ch_p.setDir(request.getParameter("dir"));
                u_ch_p.setEmail(request.getParameter("email"));
                u_ch_p.setFb(request.getParameter("fb"));
                u_ch_p.setTwitter(request.getParameter("twitter"));
                u_ch_p.setNombre(request.getParameter("name"));
                String apodo = request.getParameter("apodo");
                if(!"".equals(apodo))
                {
                    query = em.createNamedQuery("Usuario.apodo", Usuario.class);
                    query.setParameter("apodo", apodo);
                    lr = query.getResultList();
                    if(lr != null)
                        u_ch_p.setApodo(apodo);
                    else
                        msg = "<div class= \"alert alert-danger\">Apodo pillado</div>";
                }
                try {
                    msg = "<div class= \"alert alert-success\"> Informacion cambiada</div>";
                    editar(u_ch_p);
                } catch (RuntimeException e) {
                    msg = "<div class= \"alert alert-danger\">Error usuario</div>";
                }
                request.setAttribute("msg", msg);
                request.setAttribute("usuario", u_ch_p);
                vista = "/WEB-INF/admin/cambiarPerfil.jsp";
                break;
            case "apodo_val":
                String apodoVal = request.getParameter("id");
                query = em.createNamedQuery("Usuario.apodo", Usuario.class);
                query.setParameter("apodo", apodoVal);
                lr = query.getResultList();
                if (lr.size() > 0) {
                    request.setAttribute("idvalido", "No");
                } else {
                    request.setAttribute("idvalido", "Ok");
                }
                vista = "/WEB-INF/include/apodoValido.jsp";
                break;
            default:
                vista = "/index.jsp";
                break;
        }
       
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

    public void editar(Object object) {
        try {
            utx.begin();
            em.merge(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }
}
