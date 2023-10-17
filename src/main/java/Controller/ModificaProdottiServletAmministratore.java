package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ModificaProdottiServletAmministratore")
public class ModificaProdottiServletAmministratore extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessione = request.getSession();
        Prodotto p = (Prodotto) sessione.getAttribute("idModificaPrezzo");
        if(!(request.getParameter("nuovoPrezzo").equals("")) && (!(request.getParameter("quantitaTotale").equals(""))))
        {
            double prezzo = Double.parseDouble(request.getParameter("nuovoPrezzo"));
            ProdottoDAO.doSetNewPrezzo(prezzo,p.getIdProdotto());
            int q = Integer.parseInt(request.getParameter("quantitaTotale"));
            int quantita = p.getQuantita()+q;
            ProdottoDAO.doUpdateQuantita(quantita,p.getIdProdotto());
            RequestDispatcher ds = request.getRequestDispatcher("HomeServletAmministratore");
            ds.forward(request, response);
        }
        else if(!(request.getParameter("nuovoPrezzo").equals("")))
        {
            double prezzo = Double.parseDouble(request.getParameter("nuovoPrezzo"));
            ProdottoDAO.doSetNewPrezzo(prezzo,p.getIdProdotto());
            RequestDispatcher ds = request.getRequestDispatcher("HomeServletAmministratore");
            ds.forward(request, response);
        }
        else if(request.getParameter("quantitaTotale")!=null)
        {
            int q = Integer.parseInt(request.getParameter("quantitaTotale"));
            int quantita = p.getQuantita()+q;
            ProdottoDAO.doUpdateQuantita(quantita,p.getIdProdotto());
            RequestDispatcher ds = request.getRequestDispatcher("HomeServletAmministratore");
            ds.forward(request, response);
        }
    }
}
