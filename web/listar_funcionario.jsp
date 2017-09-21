<%-- 
    Document   : listar_funcionario
    Created on : 13/09/2017, 21:30:50
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 
    transitional//en">
<html>
    <head>
        <title>Lista de Departamentos</title>
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
            function MenuPrincipal() {
            document.frmPesquisa.flag.value = "menu_funcionario";
            document.frmPesquisa.submit();
            }
        </script>
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de funcionários - Funcionários(s) pesquisado(s)</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmPesquisar" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <% 
                            vo.FuncionarioVo funcionarioVo[] = null;
                            funcionarioVo = (vo.FuncionarioVo[]) request.getAttribute("funcionarioVo");
                         %>   
                         <tr id="cabecalho">
                             <td> Id </td>
                             <td>Departamento</td>
                             <td> Nome </td>
                             <td> Telefone </td>
                             <td>Cargo</td>
                             <td>Salário</td>
          
                         </tr>
                         <% for (int i = 0; i < funcionarioVo.length; i++) {%>
                         <tr>
                             <td> <%out.print(funcionarioVo[i].getIdeFun());%> </td>
                             <td><%out.pritln(funcionarioVo[i].getNomFun());%></td>
                             <td><%out.pritln(funcionarioVo[i].getTelFun());%></td>
                                 
                         </tr>
                         <%}%>
                         <tr>
                            <td colspan="2" id="botoes">
                                
                                <input id="botao" type="button" name="btnPesquisar" 
                                       onclick="Pesquisar()" value="Pesquisar">
                                <input id="botao" type="reset" name="btnReset" 
                                       value="Limpar">
                                <input id="botao" type="button" name="btnVoltar" 
                                       onclick="voltar()" value="Voltar">
                                <input type="hidden" name="flag" value=" ">
                                <input type="hidden" name="menu" value=" ">
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
        </div>
    </body>
</html>
