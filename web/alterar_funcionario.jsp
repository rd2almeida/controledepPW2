<%-- 
    Document   : alterar_funcionario
    Created on : 13/09/2017, 21:29:38
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 
    transitional//en">
<html>
    <head>
        <title>Controle de funcionários</title>
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
            var t = /^\(\d{2}\) \d{4}-\d{4}$/;
            var c = /^[+-]?((\d+)(\.\d*)?|\.\d+)$/;
            function alterar() {
                if (t.test(document.frmAlterarFuncionario.txtTelFun.value)) {
                    if (c.test(document.frmAlterarFuncionario.txtSalFun.value)) {
                        document.frmAlterarFuncionario.flag.value = "form_alterar_funcionario";
                        document.frmAlterarFuncionario.submit();
                    } else {
                        alert("Salário inválido");
                        document.frmAlterarFuncionario.txtSalFun.focus();
                    }
                } else {
                    alert("Telefone inválido");
                    document.frmAlterarFuncionario.txtTelFun.focus();
                }
            }
            Function Voltar(){
                history.go(-1);
            }
        </script>
    </head>
    <body>
        <%
            vo.FuncionarioVo funcionarioVo[] = null;
            funcionarioVo = (vo.FuncionarioVo[]) request.getAttribute("funcionarioVo");
            vo.DepartamentoVo departamentoVo[] = null;
            departamentoVo = (vo.DepartamentoVo[]) request.getAttribute("departamentoVo");
        %>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de funcionários - Alteração de dados</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmAlterarFuncionario" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <%for (int i = 0; i < funcionarioVo.length; i++) {%>
                        <tr>
                            <td>
                                <label>ID:</label>
                            </td>
                            <td>
                                <input id="campo" size="10" type="text"
                                       name="txtIdeFun" value= <%=departamentoVo[i].getIdeFun()%>
                                       readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Departamento</label>
                            </td>
                            <td>
                                <select name="txtIdeDep" id="campo">
                                    <%for (int x = 0; x < departamentoVo.length; x++) {%>
                                    if (departamentoVo[x].getIdeDep()==funcionarioVo[i].getIdeDep()){%>
                                    <option selected="selected"
                                            value="<%=departamentoVo[x].getIdeDep()%>">
                                        <%=departamentoVo[x].getNomDep()%>
                                        <%}else {%>
                                    <option value="<%=departamentoVo[x].getIdeDep()%>">
                                        <%=departamentoVo[x].getNomDep()%>
                                        <%
                                            }
                                            }
%>
                                       
  
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Nome:</label>
                            </td>
                            <td>
                                <input id="campo" size="40" type="text"
                                       name="txtNomFun" value="<%=funcionarioVo[i].getNomFun()%>"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Telefone: </label>
                            </td>
                            <td>
                                <input id="campo" size="15" type="text"
                                       name="txtTelFun" value='<%funcionarioVo[i].getTelFun()%>'>
                                <label id="explica"> Formato: (xx)x xxxx-xxxx </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                    <label>Cargo</label>
                                </td>
                                <td>
                                    <input id="campo" size="30" type="text"
                                           name="txtCarFun" value="<%=funcionarioVo[i].getCarFun()%>">
                                </td>
                            </tr>
                            <tr>
                          
                            <td>
                                    <label>Salario:</label>
                                </td>
                                <td>
                                    <input id="campo" size="15" type="text"
                                           name="txtSalFun" value="<%funcionarioVo[i].getSalFun()%>">
                                    <label id="explica"> Formato: 00000.00 </label>
                                    <%}%>
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