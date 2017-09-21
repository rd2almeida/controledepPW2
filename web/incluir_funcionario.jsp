<%-- 
    Document   : incluir_funcionario
    Created on : 13/09/2017, 21:28:55
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd HTML 4.0 
    Transitional//en">
<html>
    <html>
        <head>
            <title>Controle de Funcionarios</title>
            <link rel="stylesheet" type="text/css" href="formatos.css">
            <script type="text/javascript" language="javascript">
                var t = /^\(\d{2}\) \d{4}-\d{4}$/;
                var c = /^[+-]?((\d+)(\.\d*)?|\.\d+)$/;
                function incluir() {
                if (t.test (document.frmIncluirFuncionario.txtTelFun.value)){
                    if (c.test (document.frmIncluirFuncionario.txtSalFun.value)){
                document.frmIncluirFuncionario.flag.value = "form_incluir_funcionario";
                document.frmIncluirFuncionario.submit();
                } else{
                alert ("Salário inválido");
                document.frmIncluirFuncionario.txtSalFun.focus();
                }
                }else{
                    alert("Telefone inválido");
                    document.frmIncluirFuncionario.txtTelFun.focus();
                }
                Function Voltar(){
                history.go ( - 1);
                }
            </script>
        </head>
        <body>
            <%
                int ultFun = Integer.parseInt (request.getAttribute
                ("ultimoFuncionário").toString());
            ultFun++;
            vo.DepartamentoVo departamento[] = null;
            departamento = (vo.DepartamentoVo[]) request.getAttribute("departamento");
            %>
            <div id="principal">
                <div id="titulo">
                    <h3>Controle de funcionarios - Inclusão de dados</h3>
                </div>
                <div id="formulario">
                    <hr>
                    <table id="tabcampos">
                        <form name="frmIncluirFuncionario" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                            <tr>
                                <td>
                                    <label>ID:</label>
                                </td>
                                <td>
                                    <input id="campo" size="10" type="text"
                                           name="txtIdeDep" value="<%=ultFun%>"
                                           readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Departamento</label>
                                </td>
                                <td>
                                    <select id="campo" name="txtIdeDep">
                                        <%for (int i = 0; i < departamentoVo.length; i++) {%>
                                        <option value="<%=departamentoVo[i].getIdeDep()%>"><%=departamentoVo[i].getNomDep()%>
                                            <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Nome:</label>
                                </td>
                                <td>
                                    <input id="campo" size="40" type="text"
                                           name="txtNomFun"> 
                                </td>
                            </tr>
                            <tr> 
                                <td>
                                    <label>Telefone</label>
                                </td>
                                <td>
                                    <input id="campo" size="15" type="text"
                                           name="txtTelFun"> <label id="explica"> Formato: (xx)x xxxx-xxxx </label>
                                </td>
                            </tr>
                            <tr>
                            <td>
                                    <label>Cargo</label>
                                </td>
                                <td>
                                    <input id="campo" size="30" type="text"
                                           name="txtCarFun">
                                </td>
                            </tr>
                            <tr>
                          
                            <td>
                                    <label>Salario:</label>
                                </td>
                                <td>
                                    <input id="campo" size="15" type="text"
                                           name="txtSalFun"> <label id="explica"> 
                                        Formato: 00000.00 </label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="botoes">
                                    <input id="botao" type="button" name="btnIncluir" 
                                           onclick= "incluir()" value="Incluir">
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