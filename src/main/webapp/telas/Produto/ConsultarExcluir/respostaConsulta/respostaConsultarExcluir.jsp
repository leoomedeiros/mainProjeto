<%-- 
    Document   : respostaConsultarExcluir
    Created on : Nov 10, 2017, 9:53:31 AM
    Author     : r.almeida.barbosa
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Produto Consultado:</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="produtoConsultarExcluir1.1.css" type="text/css" rel="stylesheet">
        <script src="produtoConsultarExcluir1.1.js" type="text/javascript" rel="javascript"></script>
    </head>
    <body>
        <div id="direito">
            <div id="cabecalho">
                <!--<img class="logo" src="https://i.imgur.com/mgK1d4U.jpg"/> -->
                <img class="logo" src="http://i65.tinypic.com/2uenpch.png"/>
                <h1>Produto Consultado:</h1>


            </div>

            <div id="conteudo">
                <form class="pesquisa" action="${pageContext.request.contextPath}/ProdutoConsultarExcluirServletConsulta" method="post">  
                    <div id="contEsq" class="divisoria">
                        <h4><br></h4>
                        <input type="text" name="nomeProduto" placeholder="Digite aqui o que deseja buscar..."><br>


                    </div>

                    <div id="contDir" class="divisoria">
                        <h4>Pesquisar Por:</h4>    
                        <select name="selectConsulta">
                            <option value="nome">Nome</option>
                            <option value="todos">Todos</option>

                        </select>

                    </div>

                    <input class="botao" name="buscar" type="submit" value="Buscar">
                </form>
                <div class="divTabela">



                    <table >

                        <tr>
                            <th>Codigo:</th>
                            <th>Nome:</th>
                            <th>Categoria:</th>
                            <th>Cor:</th>
                            <th>Tamanho:</th>
                            <th>Quantidade:</th>
                            <th>Descrição:</th>
                            <th>Preço:</th>
                        </tr>



                        <c:forEach var="listaProdutos" items="${sessionScope.listaProdutos}">
                            <tr class="linhas">
                                <td><c:out value="${listaProdutos.id}"/></td>
                                <td><c:out value="${listaProdutos.nomeProduto}"/></td>
                                <td><c:out value="${listaProdutos.categoria}"/></td>
                                <td><c:out value="${listaProdutos.cor}"/></td>
                                <td><c:out value="${listaProdutos.tamanho}"/></td>
                                <td><c:out value="${listaProdutos.quantidade}"/></td>
                                <td><c:out value="${listaProdutos.descricao}"/></td>
                                <td><c:out value="${listaProdutos.preco}"/> </td>
                            </tr>
                        </c:forEach>


                    </table>



                </div>

                <hr>

                <form class="excluirAlterar" action="${pageContext.request.contextPath}/ProdutoConsultarExcluirServletAlteracao" method="post">
                    <h4>Digite o codigo do Produto:</h4>
                    <input type="number" name="inserirCodigo" ><br>
                    <div class="boxBotoes">
                        <input class="botao" name="alterar" type="submit" value="Alterar Produto">
                    </div>
                </form>
                <form class="excluirAlterar" action="${pageContext.request.contextPath}/ProdutoConsultarExcluirServletExclusao" method="post">
                    <h4>Digite o codigo do Produto:</h4>
                    <input type="number" name="inserirCodigo" ><br>
                    <div class="boxBotoes">
                        <input class="botao" name="excluir" type="submit" value="Excluir Produto">
                    </div>
                </form>


            </div>

        </div>


        <div class="menu principal">
            <div class="usuario">
                <div class="informacoes">
                    <h5>Nome do Usuario</h5>
                    <h6>Cargo do Usuario</h6>
                </div>
                <img class="imagemPerfil" src="http://i63.tinypic.com/2zspjlh.jpg"/>
            </div>

            <ul class="menu">
                <li type="visible">
                    <a href="../../../home/home.jsp">Home</a>
                </li>
                <li type="visible">
                    <a>CRUD Produto</a>

                </li>
                <li type="visible">
                    <a>CRUD Cliente</a>

                </li>
                <li type="visible">
                    <a href="../../venda/venda.html">Venda</a>                    
                </li>
                <li type="visible">
                    <a>Relatórios</a>

                </li>
                <li type="visible">
                    <a>Usuários</a>

                </li>
                <li type="visible">
                    <a href="#">Sair</a>
                </li>  
            </ul>
        </div>

        <div id="subProduto" class="sub">
            <ul class="submenu">
                <li>
                    <a href="../../Cadastrar/produtoCadastrar.jsp">Cadastrar Produto</a>
                </li>
                <li>
                    <a href="../../ConsultarExcluir/produtoConsultarExcluir.jsp">Consultar Produto</a>
                </li>
            </ul>
        </div>

        <div id="subCliente" class="sub">
            <ul class="submenu">
                <li>
                    <a href="#">Cadastrar Cliente</a>
                </li>
                <li>
                    <a href="#">Consultar Cliente</a>
                </li>
            </ul>
        </div>

        <div id="subRelatorio" class="sub">
            <ul class="submenu">
                <li id="relProduto" type="hidden">
                    <a href="../../../Relatorio/relatorioProduto_falta/relatorioProduto.jsp">Relatório de Produto</a>
                </li>
                <li id="relVenda" type="hidden">
                    <a href="../../../Relatorio/RelatorioVenda/relatorioVenda.jsp">Relatório de Venda</a>
                </li>
                <li id="relLog" type="hidden">
                    <a href="../../../Relatorio/relatorioLog_falta/relatorioLog.jsp">Relatório de Log</a>
                </li>
            </ul>
        </div>

        <div id="subUsuario" class="sub">
            <ul class="submenu" >
                <li>
                    <a href="#">Cadastrar Usuário</a>
                </li>
                <li>
                    <a href="#">Consultar Usuário</a>
                </li>
            </ul>
        </div>

    </body>
</html>
