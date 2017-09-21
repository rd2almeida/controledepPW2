<%-- 
    Document   : alterar_departamento
    Created on : 13/09/2017, 21:29:24
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 
    transitional//en">
<html>
    <head>
        <title>Controle de Departamento</title>
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
            var t = /^\(\d{2}\)\d{4}-d{4}$/;
            function alterar() {
            if (t.test (document.frmAlterarDepartamento.txttelDep.value)){
            document.frmAlterarDepartamento.flag.value = "form_alterar_departamento";
            document.frmAlterarDepartamento.submit();
            } else{
            alert ("Telefone inválido");
                    document.frmAlterarDepartamento.txtTelDep.focus();
            }
            }
            Function Voltar(){
            history.go ( - 1);
            }
        </script>
    </head>
    <body>
        <%
            vo.DepartamentoVo departamentoVo[] = null;
            departamentoVo = (vo.DepartamentoVo[]) request.getAttribute("departamentoVo");
        %>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de departamentos - Alteração de dados</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmAlterarDepartamento" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <%for (int i = 0; i < departamentoVo.length; i++) {%>
                        <tr>
                            <td>
                                <label>ID:</label>
                            </td>
                            <td>
                                <input id="campo" size="10" type="text"
                                       name="txtIdeDep" value= <%=departamentoVo[i].getIdeDep()%>
                                       readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Nome:</label>
                            </td>
                            <td>
                                <input id="campo" size="50" type="text"
                                       name="txtNomDep" value="<%=departamentoVo[i].getNomDep()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Telefone: </label>
                            </td>
                            <td>
                                <input id="campo" size="15" type="text"
                                       name="txtTelDep"> <label id="explica"> Formato: (xx)x xxxx-xxxx </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="botoes">
                                <%}%>
                                <input id="botao" type="button" name="btnAlterar" 
                                       onclick="alterar()" value="Alterar">
                                <input id="botao" type="reset" name="btnResetr" 
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

