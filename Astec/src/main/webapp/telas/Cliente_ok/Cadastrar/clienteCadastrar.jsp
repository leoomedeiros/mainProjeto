<%-- 
    Document   : clienteCadastrar
    Created on : 10/11/2017, 12:16:33
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastrar de Cliente:</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="clienteCadastrar.css" rel="stylesheet">
        <script src="clienteCadastrar.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="direito">
            <div id="cabecalho">
                <!--<img class="logo" src="https://i.imgur.com/mgK1d4U.jpg"/> -->
                <img class="logo" src="http://i65.tinypic.com/2uenpch.png"/>
                <h1>Cadastrar Cliente:</h1>
                    
                
            </div>
            
            <div id="conteudo">
                <form action="${pageContext.request.contextPath}/CadastrarCliente" method="post">  
                    <div id="contEsq" class="divisoria">
                        <h4>Nome completo:<br></h4>
                        <input type="text" name="nomeCliente"><br>

                        <h4>CPF:<br></h4>
                        <input type="number" name="cpf"><br>

                        <h4>Endereço:<br></h4>
                        <input type="text" name="endereco"><br>

                        <h4>Telefone:<br></h4>
                        <input type="number" name="telefone" <br>
                    </div>

                    <input name="enviar" type="submit" value="Cadastrar">
                    
                    
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
                    <a href="../../home/homeindex.html">Home</a>
                </li>
                <li type="visible">
                    <a>CRUD Cliente</a>
                      
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
                    <a href="#">Usuários</a>
                    
                </li>
                <li type="visible">
                    <a href="#">Sair</a>
                </li>  
            </ul>
        </div>

        <div id="subCliente" class="sub">
            <ul class="submenu">
                    <li>
                        <a href="cadastroCliente.html">Cadastrar Cliente</a>
                    </li>
                    <li>
                        <a href="../consultaCliente/consultaCliente.html">Consultar Cliente</a>
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
                        <li id="relCliente" type="hidden">
                            <a href="#">Relatório de Cliente</a>
                        </li>
                        <li id="relVenda" type="hidden">
                            <a href="#">Relatório de Venda</a>
                        </li>
                        <li id="relLog" type="hidden">
                            <a href="#">Relatório de Log</a>
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