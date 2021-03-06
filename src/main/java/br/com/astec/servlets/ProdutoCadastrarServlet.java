package br.com.astec.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import br.com.astec.model.dao.ProdutoDao;
import br.com.astec.model.entidades.Produto;
import br.com.astec.model.entidades.ValidarProduto;
import java.io.IOException;
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
 * @author rafael.abarbosa1
 */
@WebServlet(name = "ProdutoCadastrarServlet", urlPatterns = {"/ProdutoCadastrarServlet"})
public class ProdutoCadastrarServlet extends HttpServlet {

    java.util.Date utilDate = new java.util.Date();
    java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());
    boolean camposValidos = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        Produto novo = (Produto) sessao.getAttribute("novoProduto");
        String destino;
        if (novo != null) {
            request.setAttribute("novoProd", novo);

            sessao.removeAttribute("novoProd");
            destino = "telas/Produto/Cadastrar/respostaCadastroProduto.jsp";
        } else { // usuario acessou normalmente
            destino = "telas/Produto/Cadastrar/produtoCadastar.jsp";
        }

        response.sendRedirect(destino);
        /*RequestDispatcher dispatcher
                = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);*/

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        String nomeProduto = request.getParameter("nomeProduto");
        String categoria = request.getParameter("categoria");
        int tamanho = Integer.parseInt(request.getParameter("tamanho"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String cor = request.getParameter("cor");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        String descricao = request.getParameter("descricao");

        Produto novo = new Produto(sq, nomeProduto, categoria, cor, tamanho,
                quantidade, descricao, preco);

        HttpSession sessao = request.getSession();
        sessao.setAttribute("novoProduto", novo);
        
        ValidarProduto validar = new ValidarProduto();
        boolean valido = validar.ehPalavra(novo);

        if (valido) {

            try {
                ProdutoDao produto = new ProdutoDao();
                produto.incluir(novo);

            } catch (Exception ex) {
                Logger.getLogger(ProdutoCadastrarServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {

            } catch (Exception ex) {
                Logger.getLogger(ProdutoCadastrarServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            response.sendRedirect(request.getContextPath() + "/ProdutoCadastrarServlet");
        } else {
            response.sendRedirect("telas/Produto/MensagemErro.jsp");

        }

    }

}
