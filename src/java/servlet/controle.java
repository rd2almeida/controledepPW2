/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.ir.RuntimeNode;
import service.DepartamentoService;
import vo.DepartamentoVo;
import service.FuncionarioService;
import vo.FuncionarioVo;

public class controle extends HttpServlet {
    protected void processRequest (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType ("tex/html;charset=ISO-8859-1");
        String jsp = null;
        String menu = request.getParameter("menu");
        String flag = request.getParameter("flag");
        
        String[] dados =new String[2];
        
        DepartamentoService departamentoService = new
            DepartamentoService();
        DepartamentoVo departamentoVo[] = null;
        DepartamentoVo departamentoVoAux = new DepartamentoVo();
        
        FuncionarioService funcionarioService = new
            FuncionarioService();
        FuncionarioVo funcionarioVo[] = null;
        FuncionarioVo funcionarioVoAux = new FuncionarioVo();
        if (menu.equals("menu_departamento")){
            jsp = "menu_departamento.jsp";
        }else if (menu.equals("menu_funcionario")){
            jsp = "menu_funcionario.jsp";
        }
        if (menu.equals("")) {
            if (flag.equals("form_incluir_departamento")|| 
                    flag.equals("form_alterar_departamento")){
                departamentoVoAux.setIdeDep(Integer.parseInt(request.getParameter("txtIdeDep")));
                departamentoVoAux.setNomDep(request.getParameter("txtNomDep"));
                departamentoVoAux.setTelDep(request.getParameter("txtTelDep"));
            } else if (flag.equals("form_pesquisa_alterar_departamento")|| flag.equals("form_excluir_departamento")
                    || flag.equals("form_pesquisar_departamento")){
                departamentoVoAux.setIdeDep(Integer.parseInt(request.getParameter("txtIdeDep")));
                }else if (flag.equals("form_incluir_funcionario")|| flag.equals("form_alterar_funcionario")){
                    funcionarioVoAux.setIdeFun (Integer.parseInt(request.getParameter("txtIdeFun")));
                    funcionarioVoAux.setIdeDep(Integer.parseInt(request.getParameter("txtIdeDep")));
                    funcionarioVoAux.setNomFun(request.getParameter("txtNomFun"));
                    funcionarioVoAux.setTelFun(request.getParameter("txtTelFun"));
                    funcionarioVoAux.setCarFun(request.getParameter("txtCarFun"));
                    funcionarioVoAux.setSalFun(Double.parseDouble(request.getParameter("txtSalFun")));
                }else if (flag.equals("form_pesquisa_alterar_funcionario")|| 
                        flag.equals("form_excluir_funcionario")||flag.equals("form_pesquisar_funcionario")){
                    funcionarioVoAux.setIdeFun (Integer.parseInt(request.getParameter("txtIdeFun")));
                }
            if(flag.equals("form_incluir_departamento")){
                departamentoService.inserirDepartamento(departamentoVoAux);
                dados[0] = "incluir";
                dados[1] ="departamento";
                request.setAttribute("dadosRetorno", dados);
                jsp ="mensagem.jsp";
            } else if (flag.equals("form_alterar_departamento")){
                departamentoService.alterarDepartamento(departamentoVoAux);
                dados[0]="alterar";
                dados[1]= "departameto";
                request.setAttribute("dados Retorno", dados);
                jsp = "mensagem.jsp";
            }else if (flag.equals("form_pesquisa_alterar_departamento")){
                departamentoVo = departamentoService.pesquisarDepartamento(departamentoVoAux.getIdeDep());
                if (departamentoVo.length > 0){
                    jsp = "alterar_departamento.jsp";
                    request.setAttribute("departamentoVo", departamentoVo);
                }else{
                    dados[0] ="consultar";
                    dados[1] ="departamento_inexistente";
                    request.setAttribute("dadosRetorno", dados);
                    jsp = "mensagem.jsp";
                }
            }else if (flag.equals("form_excluir_departamento")){
                int r = departamentoService.excluirDepartamento(departamentoVoAux.getIdeDep());
                dados[0] = "excluir";
                if (r == 1){
                    dados[1] = "departamento";
                }else{
                    dados[1] = "departamento_inexistente";
                }
                request.setAttribute("dadosRetorno", dados);
                jsp = "mensagem.jsp";
            }else if (flag.equals("form_pesquisar_departamento")){
                departamentoVo = departamentoService.pesquisarDepartamento(departamentoVoAux.getIdeDep());
                if (departamentoVo.length > 0){
                    jsp = "lista_departamentos.jsp";
                    request.setAttribute("departamentoVo", departamentoVo);
                }else{
                    dados[0] = "consultar";
                    dados[1] ="departamento_inexistente";
                    request.setAttribute("dadosRetorno", dados);
                    jsp = "mensagem.jsp";
                }
            }else if(flag.equals("form_incluir_funcionario")){
                funcionarioService.inserirFuncionario(funcionarioVoAux);
                dados[0] = "incluir";
                dados[1] ="funcionario";
                request.setAttribute("dadosRetorno", dados);
                jsp ="mensagem.jsp";
            } else if (flag.equals("form_alterar_funcionario")){
                funcionarioService.alterarFuncionario(funcionarioVoAux);
                dados[0]="alterar";
                dados[1]= "funcionario";
                request.setAttribute("dados Retorno", dados);
                jsp = "mensagem.jsp";
            }else if (flag.equals("form_pesquisa_alterar_funcionario")){
                funcionarioVo = funcionarioService.pesquisarFuncionario(funcionarioVoAux.getIdeFun());
                if (funcionarioVo.length > 0){
                    jsp = "alterar_funcionario.jsp";
                    request.setAttribute("funcionarioVo", funcionarioVo);
                    departamentoVo = departamentoService.pesquisarDepartamentos();
                    request.setAttribute("departamentoVo", departamentoVo);
                }else{
                    dados[0] ="consultar";
                    dados[1] ="funcionario_inexistente";
                    request.setAttribute("dadosRetorno", dados);
                    jsp = "mensagem.jsp";
                }
            }else if (flag.equals("form_excluir_funcionario")){
                int r = funcionarioService.excluirFuncionario(funcionarioVoAux.getIdeFun());
                dados[0] = "excluir";
                if (r == 1){
                    dados[1] = "funcionario";
                }else{
                    dados[1] = "funcionario_inexistente";
                }
                request.setAttribute("dadosRetorno", dados);
                jsp = "mensagem.jsp";
            }else if (flag.equals("form_pesquisar_funcionario")){
                funcionarioVo = funcionarioService.pesquisarFuncionario(funcionarioVoAux.getIdeFun());
                if (funcionarioVo.length > 0){
                    jsp = "lista_funcionario.jsp";
                    request.setAttribute("funcionarioVo", funcionarioVo);
                    departamentoVo = departamentoService.pesquisarDepartamento(funcionarioVo[0].getIdeDep());
                    request.setAttribute("departamentoVo", departamentoVo);
                }else{
                    dados[0] = "consultar";
                    dados[1] ="funcionario_inexistente";
                    request.setAttribute("dadosRetorno", dados);
                    jsp = "mensagem.jsp";
                }
                }
        }else if (menu.equals("principal")){
            if (flag.equals("departamento")){
                jsp = "menu_departamento.jsp";
            }else if (flag.equals("funcionario")){
                jsp = "menu_funcionario.jsp";
            }
        }else if (menu.equals("departamento")){
            if (flag.equals("incluir")){
                int ultimoIdeDep = departamentoService.pesquisarUltimoDepartamento();
                request.setAttribute("ultimoDepartamento", ultimoIdeDep);
                jsp = "incluir_departamento.jsp";
            } else if (flag.equals("pesquisaralterar")){
                jsp = "pesquisar_alterar_depatamento.jsp";
            }else if (flag.equals("excluir")){
                jsp ="excluir_departamento.jsp";
            }else if (flag.equals("pesquisar")){
                jsp = "pesquisar_departamento.jsp";
            }else if (flag.equals("pesquisartodos")){
                departamentoVo = departamentoService.pesquisarDepartamentos();
                if (departamentoVo.length > 0){
                    jsp = "lista_departamentos.jsp";
                    request.setAttribute("departamentoVo", departamentoVo);
                }else{
                    dados[0] ="consultar";
                    dados[1] ="departamento_inexistente";
                    request.setAttribute("dadosRetorno", dados);
                    jsp ="mesagem.jsp";
                }
            }
            
        }else if (menu.equals("funconario")){
            if (flag.equals("incluir")){
                int ultimoIdeFun = funcionarioService.pesquisarUltimoFuncionario();
                request.setAttribute("ultimoFuncionario", ultimoIdeFun);
                departamentoVo = departamentoService.pesquisarDepartamentos();
                request.setAttribute("departamentoVo", departamentoVo);
                jsp = "incluir_funcionario.jsp";
           }else if (flag.equals("pesquisaralterar")){
               jsp = "pesquisa_alterar_funcionario.jsp";
           }else if (flag.equals("excluir")){
               jsp = "excluir_funcionario.jsp";
           }else if (flag.equals("pesquisar")){
               jsp = "pesquisar_funcionario.jsp";
           }else if (flag.equals("pesquisartodos")){
               funcionarioVo = funcionarioService.pesquisarFuncionarios();
               if (funcionarioVo.length > 0){
               jsp = "lista_funcionarios,jsp";
               request.setAttribute("funcionarioVo", funcionarioVo);
               departamentoVo = departamentoService.pesquisarDepartamentos();
               request.setAttribute("departamentoVo", departamentoVo);
           }else{
                   dados[0] = "consultar";
                   dados[1] = "funcionario_inexistente";
                   request.setAttribute("dadosRetorno", dados);
                   jsp = "mensagem.jsp";
               }
           }
        }
        RequestDispatcher dispatcher = null;
        dispatcher = request.getRequestDispatcher(jsp);
        dispatcher.forward(request, response);
    }
    protected void doGet (HttpServletRequest request,
            HttpServletResponse response) throws ServletException,IOException {
        processRequest (request, response);
    }
    protected void doPost (HttpServletRequest request,
            HttpServletResponse response) throws ServletException,IOException {
        processRequest (request, response);
    }
}

