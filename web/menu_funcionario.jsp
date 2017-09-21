<%-- 
    Document   : menu_funcionario
    Created on : 13/09/2017, 21:28:12
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 
    Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Controle de funcionários</title>
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
        function incluir(){
            document.frmMenu.flag.value = "incluir";
            document.frmMenu.submit();
        }
        function alterar(){
            document.frmMenu.flag.value = "pesquisaalterar";
            document.frmMenu.submit();
        }
        function excluir(){
            document.frmMenu.flag.value = "excluir";
            document.frmMenu.submit();
        }
        function pesquisar(){
            document.frmMenu.flag.value = "pesquisar";
            document.frmMenu.submit();
        }
        function pesquisarTodos(){
            document.frmMenu.flag.value = "pesquisartodos";
            document.frmMenu.submit();
        }
        function retornar(){
           location.href="index.jsp";
        }
        </script>
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de Funcionários</h3>        
        </div>
            <div id="menuSuperior">
                <form name="frmMenu" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle"
                    method="post">>
                    <table id="tabmenu">
                        <tr>
                            <td>
                                <input id="botao" type="button"
                                       name="btnIncluir" onclick="incluir()"
                                       value="Incluir">    
                            </td>
                            <td>
                                <input id="botao" type="button"
                                       name="btnAlterar" onclick="alterar()"
                                       value="Alterar">    
                            </td>
                            <td>
                                <input id="botao" type="button"
                                       name="btnExcluir" onclick="excluir()"
                                       value="Excluir">    
                            </td>
                            <td>
                                <input id="botao" type="button"
                                       name="btnPesquisar" onclick="pesquisar()"
                                       value="Pesquisar">    
                            </td>
                            <td>
                                <input id="botao" type="button"
                                       name="btnPesquisarTodos" onclick="pesquisarTodos()"
                                       value="ConsultarTodos">    
                            </td>
                            <td>
                                <input id="botao" type="button"
                                       name="btnVoltar" onclick="retornar()"
                                       value="Menu Principal">
                                <input type="hidden" name="flag" value="">
                    <input type="hidden" name="menu" value="funcionario">
                            </td>
                        </tr>
                    </table>                       
                </form>
            </div>    
        </div>
    </body>
</html>