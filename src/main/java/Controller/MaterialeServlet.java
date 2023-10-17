package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/MaterialeServlet")
public class MaterialeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        String mat= (String) session.getAttribute("mat");
        String materiale= (String) session.getAttribute("materiale");
        ArrayList<Prodotto>prodottiMateriale = new ArrayList<>();
        if(materiale!=null)
        {
            if (mat.equalsIgnoreCase("materasso"))
            {
                prodottiMateriale = ProdottoDAO.doRetriveMaterialeMaterasso(materiale);
            }
            else if(mat.equalsIgnoreCase("rete"))
            {
                prodottiMateriale=ProdottoDAO.doRetriveMaterialeRete(materiale);
            }
            else if(mat.equalsIgnoreCase("cuscino"))
            {
                prodottiMateriale=ProdottoDAO.doRetriveMaterialeCuscino(materiale);
            }
            if(prodottiMateriale.size()==0)
            {
                RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/RicercaErrata.jsp");
                ds.forward(request, response);
            }
            request.setAttribute("prodottiMateriale",prodottiMateriale);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/ProdottiMateriale.jsp");
            ds.forward(request, response);
        }
        if(materiale==null || mat==null)
        {
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/RicercaErrata.jsp");
            ds.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
