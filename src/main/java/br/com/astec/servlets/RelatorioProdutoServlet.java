/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.astec.servlets;

import br.com.astec.model.dao.LogDao;
import br.com.astec.model.dao.ProdutoDao;
import br.com.astec.model.entidades.LogFuncionario;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuário
 */
@WebServlet(name = "RelatorioProdutoServlet", urlPatterns = {"/RelatorioProdutoServlet"})
public class RelatorioProdutoServlet extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        
        String dataInicial = request.getParameter("dataIni");
        String dataFinal = request.getParameter("dataFin");
        
        session.setAttribute("dtInicio", dataInicial);
        session.setAttribute("dtFim",dataFinal);
        
        
        
        List<LogFuncionario> lista;
        
        if ((!dataInicial.isEmpty())&&(!dataFinal.isEmpty())){
            try {
                ProdutoDao pD = new ProdutoDao();
                lista = pD.consultaPorDatas(dataInicial, dataFinal);
                session.setAttribute("listaLogProduto", lista);

  
                
            } catch (Exception ex) {
                Logger.getLogger(RelatorioLogServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        response.sendRedirect("telas/Relatorio/relatorioProduto_falta/relatorioProduto.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
