<%-- 
    Document   : pesquisa_alterar_funcionario
    Created on : 13/09/2017, 21:31:33
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd HTML 4.0
    Transitional//en">
<html>
    <head>
        <title>Controle de Funcionários</title>
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
            function Alterar() {
            document.frmPesquisaAlterar.flag.value = "form_pesquisa_alterar_funcionario";
            document.frmPesquisaAlterar.submit();
            }
            function Voltar(){
            history.go ( - 1);
            }
        </script>
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Pesquisa de funcionários - Pesquisa funcionários para alterar dados</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmPesquisaAlterar" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <tr>
                            <td>
                                <label>ID:</label>
                            </td>
                            <td>
                                <input id="campo" size="10" type="text"
                                       name="txtIdeFun" value="">

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="botoes">
                                <input id="botao" type="button" name="btnAlterar" 
                                       onclick="Alterar()" value="Alterar">
                                <input id="botao" type="reset" name="btnResetr" 
                                       value="Limpar">
                                <input id="botao" type="button" name="btnVoltar" 
                                       onclick="Voltar()" value="Voltar">
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
