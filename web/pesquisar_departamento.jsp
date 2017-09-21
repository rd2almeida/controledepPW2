<%-- 
    Document   : pesquisar_departamento
    Created on : 13/09/2017, 21:32:02
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
            function Pesquisar() {
            document.frmPesquisar.flag.value = "form_pesquisar_departamento";
            document.frmPesquisar.submit();
            }
           function Voltar(){
            history.go ( - 1);
            }
        </script>
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Controle de departamentos - Pesquisa Departamentos</h3>
            </div>
            <div id="formulario">
                <hr>
                <table id="tabcampos">
                    <form name="frmPesquisar" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle" method="post">
                        <tr>
                            <td>
                                <label>ID:</label>
                            </td>
                            <td>
                                <input id="campo" size="10" type="text"
                                       name="txtIdeDep" value= "">
                                       
                            </td>
                        </tr>
                  
                        <tr>
                            <td colspan="2" id="botoes">
                                <%}%>
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
