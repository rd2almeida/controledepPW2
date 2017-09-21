<%-- 
    Document   : mensagem
    Created on : 13/09/2017, 21:32:34
    Author     : Roberta
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;
              charset= ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="formatos.css">
        <title>Mensagens de retorno</title>
    </head>
    <body id="pgmensagens">
        <p>
            <%
                String arquivo = null;
                String[] dados = (String[]) request.getAttribute("dadosRetorno");
                if (dados[0].equals("incluir") && dados[1].equals("menu_departaento")) {
                    arquivo = "menu_departamento";
            %>
            Dados do  departamento incluidos com sucesso
            <% else if (dados[0].equals("incluir")&& dados[1].equals("funcionario")){
                    arquivo = "menu_funcionario";
            %>
            Dados do funcionário incluidos com sucesso
            <% } else if (dados[0].equals("excluir")&& dados[1].equals("departamento")){
                  arquivo = "menu_departamento";
            %>
            Dados do departamento excluidos com sucesso 
            <% } else if (dados[0].equals("excluir")&& dados[1].equals("departamento_inexistente")){
               arquivo = "menu_departamento";
            %>
            Dados do departamento não encontrado
            <% } else if (dados[0].equals("excluir")&& dados[1].equals("funcionario")){
               arquivo = "menu_funcionario";
            %>
            Dados do funcionario excluidos com sucesso
            <% } else if (dados[0].equals("excluir")&& dados[1].equals("funcionario_inexistente")){
               arquivo = "menu_funcionario";
            %>
            Dados do funcionario não encontrados
            <% } else if (dados[0].equals("alterar")&& dados[1].equals("departamento")){
               arquivo = "menu_departamento";
            %>
            Dados do departamento alterados com sucesso
            <% } else if (dados[0].equals("consultar")&& dados[1].equals("departamento_inexistente")){
                arquivo = "menu_departamento";
            %>
            Dados do(s) departamento(s) não encontrado(s)
            <% } else if (dados[0].equals("consultar")&& dados[1].equals("funcionario_inexistente")){
               arquivo = "menu_funcionario";
            %> 
            Dados do(s) do(s) funcionario(s) não encontrado(s)
            <% }
            %>
        </p>
        <form name="frmMensagens" action="\Users\Roberta\Documents\NetBeansProjects\WebApplication9\src\java\servlet\controle"
              method="post">
            <table id="tabmensagens"> 
                <tr>
                    <td>
                        <input type="hidden" name="menu"
                               value="<%=arquivo%>">
                        <input id="botao" type="submit" name="btnVoltar"
                               value="Voltar ao menu">

                    </td>
                </tr>
            </table>

        </form>

    </body>
</html>

