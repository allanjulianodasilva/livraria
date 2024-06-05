<%@ page import="util.Upload"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String path = "C:/livraria/fotos";
    Upload up = new Upload();
    up.setFolderUploadIsAbsolute(true);
    up.setFolderUpload(path);
    if(up.formProcess(getServletContext(), request))
    {
        
        try {
            //Arquivos
            int id = Integer.valueOf(up.getForm().get("id") + "");
            out.print(up.getFiles().size() + "");
            String idNameFile = "";

            //Outros campos do form
            String titulo  = up.getForm().get("titulo") + "";
            String autor   = up.getForm().get("autor") + "";
            // String editora = up.getForm().get("editora") + "";
            int editora_id = Integer.valueOf(up.getForm().get("editora") + "");
            String foto_atual   = up.getForm().get("foto_atual") + "";

            if (up.getFiles().size() > 0) {
                String nameFile = up.getFiles().get(0);
                idNameFile = nameFile.substring(0,nameFile.lastIndexOf("."));
            }
            else {
                idNameFile = foto_atual;
            }
            String query = "UPDATE  livro SET titulo = ?, autor = ?, editora_id = ?, foto = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, titulo);
            pstmt.setString(2, autor);
            pstmt.setInt(3, editora_id);
            pstmt.setString(4, idNameFile);
            pstmt.setInt(5, id);
            int i = pstmt.executeUpdate();
            pstmt.close();
            if (i == 1){
                session.setAttribute("msg", "A Edição realizado com sucesso");
                response.sendRedirect("listar.jsp");
            }
            else {
                session.setAttribute("msg", "Nao foi possivel realizar o Edição");
                response.sendRedirect("editar.jsp?id="+id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.print(e);
        }
    }
    else
    {
        
    }
    // // Recuperando os parâmetros do formulário
    // int id = Integer.valueOf(request.getParameter("id"));
    // String titulo = request.getParameter("titulo");
    // String autor = request.getParameter("autor");
    // int editora_id = Integer.valueOf(request.getParameter("editora"));
    // String foto = request.getParameter("foto");

    // try {
    //     String query = "UPDATE  livro SET titulo = ?, autor = ?, editora_id = ?, foto = ? WHERE id = ?";
    //     PreparedStatement pstmt = conn.prepareStatement(query);
    //     pstmt.setString(1, titulo);
    //     pstmt.setString(2, autor);
    //     pstmt.setInt(3, editora_id);
    //     pstmt.setString(4, foto);
    //     pstmt.setInt(5, id);
    //     int i = pstmt.executeUpdate();
    //     pstmt.close();
    //     if (i == 1){
    //         session.setAttribute("msg", "Cadastro realizado com sucesso");
    //         response.sendRedirect("listar.jsp");
    //     }
    //     else {
    //         session.setAttribute("msg", "Nao foi possivel realizar o Cadastro");
    //         response.sendRedirect("cadastrar.jsp");
    //     }
    // } catch (SQLException e) {
    //     e.printStackTrace();
    // }
    
%>

