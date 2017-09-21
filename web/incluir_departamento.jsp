<%-- 
    Document   : incluir_departamento
    Created on : 13/09/2017, 21:28:33
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd HTML 4.0 
    Transitional//en">
<html>
    <html>
        <head>
            <title>Controle de Departamento</title>
            <link rel="stylesheet" type="text/css" href="formatos.css">
            <script type="text/javascript" language="javascript">
                var t = /^\(\d{2}\)\d{4}-d{4}$/;
                function verificar() {
                    if (t.test(document.frmIncluirDepartamento.txttelDep.value)) {
                        document.frmIncluirDepartamento.flag.value = "form_incluir_departamento";
                        document.frmIncluirDepartamento.submit();
                    } else {
                        alert("Telefone inválido");
                        document.frmIncluirDepartamento.txtTelDep.focus();
                    }
                }
                Function Voltar(){
                    history.go(-1);
                }
            </script>
        </head>
        <body>
            <%
                int ultDep = Integer.parseInt(request.getAttribute("ultimoDepartamento").toString());
                ultDep++;
            %>
            <div id="principal">
                <div id="titulo">
                    <h3>Controle de departamentos - Inclusão de dados</h3>
                </div>
                <div id="formulario">
                    <hr>
                    <table id="tabcampos">
                        <form name="frmIncluirDepartamento" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                            <tr>
                                <td>
                                    <label>ID:</label>
                                </td>
                                <td>
                                    <input id="campo" size="10" type="text"
                                           name="txtIdeDep" value="<%=ultDep%>"
                                           readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Nome:</label>
                                </td>
                                <td>
                                    <input id="campo" size="40" type="text"
                                           name="txtNomDep">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Telefone</label>
                                </td>
                                <td>
                                    <input id="campo" size="15" type="text"
                                           name="txtTelDep"> <label id="explica"> Formato: (xx)x xxxx-xxxx </label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="botoes">
                                    <input id="botao" type="button" name="btnIncluir" 
                                           onclick= "verificar()" value="Incluir">
                                    <input id="botao" type="reset" name="btnResetr" 
                                           value="Limpar">
                                    <input id="bota" type="button" name="btnVoltar" 
                                           onclick="voltar()" value="Voltar">
                                    <input type="hidden" name="flag" value="">
                                    <input type="hidden" name="menu" value="">
                                </td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
        </body>
    </html>


