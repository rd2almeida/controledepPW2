<%-- 
    Document   : listar_departamento
    Created on : 13/09/2017, 21:30:38
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
            document.frmPesquisa.flag.value = "menu_departamento";
            document.frmPesquisa.submit();
            }
        </script>
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de departamentos - Departamento(s) pesquisado(s)</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmPesquisar" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <% 
                            vo.DepartamentoVo departamentoVo[] = null;
                            departamentoVo = (vo.DepartamentoVo[]) request.getAttribute("departamentoVo");
                         %>   
                         <tr id="cabecalho">
                             <td> Id </td>
                             <td> Nome </td>
                             <td> Telefone </td>
          
                         </tr>
                         <% for (int i = 0; i < departamentoVo.length; i++) {%>
                         <tr>
                             <td> <%out.print(departamentoVo[i].getIdeDep());%> </td>
                             <td><%out.pritln(departamentoVo[i].getNomDep());%></td>
                             <td><%out.pritln(departamentoVo[i].getTelDep());%></td>
                                 
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
