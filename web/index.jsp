<%-- 
    Document   : index
    Created on : 13/09/2017, 21:20:22
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Menu principal</title>
        <link rel=stylesheet" type="text/css" href="formatos.css">
        <script type="text/javascript" language="javascript">
        function departamento(){
            document.frmMenu.flag.value = "departamento";
            document.frmMenu.submit();
        }
        function funcionario(){
            document.frmMenu.flag.value = "funcionario";
            document.frmMenu.submit();
        }
           function sair(){
            window.closed();
        }
        </script>
        
    </head>
    <body>
        <div id="principal">
            <div id="titulo">
                <h3>Menu Principal</h3>   
            </div>
            <div id="menuSuperior">
                <form name="frmMenu"
                      action="src\java\servlet\controle" method="post"> 
                    <table id="tabmenu">
                        <a href="incluir_funcionario.jsp"></a>
                        <tr>
                            <td>
                                <input id="botao" type="button"
                                name="btnDepartamento"
                                onclick="departamento()" value="Departamentos">
                            </td>
                            <td>
                                <input id="botao" type="button" name="btnFuncionario"
                                       onclick="funcionario()" value="Funcionarios">
                                      
                            </td>
                            <td>
                                <input id="botao" type="button" name="btnExcluir"
                                       onclick="sair()" value="Sair">
                            </td> 

                        </tr>
                    </table>
                    <input type="hidden" name="flag" value="">
                    <input type="hidden" name="menu" value="principal">
                </form>
            </div>    
        </div>
    </body>
</html>
