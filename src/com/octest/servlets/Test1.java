package com.octest.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.octest.beans.Auteur;
import com.octest.forms.ConnectionForm;

/**
 * Servlet implementation class Test1
 */
@WebServlet("/Test1")
public class Test1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        // recupere valeur du parametre  name dans URL
		String name = request.getParameter("name");
		// on l'ajoute à la request
		request.setAttribute("name", name);
		
		// Tableau
		String[] noms = {"Mathieu", "Robert", "François"};
	    request.setAttribute("noms", noms); 
	    
	    
	    // Objet Java beans auteur
	    Auteur auteur = new Auteur();
        auteur.setPrenom("Mathieu");
        auteur.setNom("Nebra");
        auteur.setActif(true);
        request.setAttribute("auteur", auteur);
	    
	    
		/*response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("Bonjour!");*/
	    
	    
		request.setAttribute("heure", "jour");
		String message = "coucou";
		request.setAttribute("var", message);
		
		// appel de la vue
		//this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
		this.getServletContext().getRequestDispatcher("/WEB-INF/formulaire.jsp").forward(request, response);

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
		
		// Recupere valeur du parametre  name dans URL
		String nom= request.getParameter("nom_for");
		request.setAttribute("nom_reponse", nom);
		
		//Objet metier : y faire le traitement (MODELE)
		ConnectionForm form = new ConnectionForm();
		form.verifierIdentifiant(request);
		request.setAttribute("form", form);
		

		// appel de la VUE : affiche des messages
		this.getServletContext().getRequestDispatcher("/WEB-INF/formulaire.jsp").forward(request, response);

		
	}

}
