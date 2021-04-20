package com.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteService() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title, content, new Date());
			//System.out.println("NOTE:::"+note.getId()+"  "+note.getTitle());
			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(note);
			transaction.commit();
			session.close();
			
			//send message
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1>Note is Added Successfully</h1>");
			out.println("<h1>Note is <a href='all_notes.jsp'>view all notes</a></h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
