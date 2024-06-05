<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="util.Upload"%>
<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    String path = "C:/livraria/fotos";
    Upload up = new Upload();
    up.setFolderUploadIsAbsolute(true);
    up.setFolderUpload(path);
    if(up.formProcess(getServletContext(), request))
    {
        try {
            //Arquivos
            String nameFile = up.getFiles().get(0);
            String idNameFile = nameFile.substring(0,nameFile.lastIndexOf("."));
            //Outros campos do form
            String titulo  = up.getForm().get("titulo") + "";
            String autor   = up.getForm().get("autor") + "";
            // String editora = up.getForm().get("editora") + "";
            int editora = Integer.valueOf(up.getForm().get("editora") + "");

            String query = "INSERT INTO livro (titulo, autor, editora_id, foto) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, titulo);
            pstmt.setString(2, autor);
            pstmt.setInt(3, editora);
            pstmt.setString(4, idNameFile);
            int i = pstmt.executeUpdate();
            pstmt.close();
            if (i == 1){
                session.setAttribute("msg", "Cadastro realizado com sucesso");
                response.sendRedirect("listar.jsp");
            }
            else {
                out.print("ERR");
                session.setAttribute("msg", "Nao foi possivel realizar o Cadastro");
                // response.sendRedirect("cadastrar.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.print(e);
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
        
            session.setAttribute("msg", "Não foi possível carregar o arquivo");
            response.sendRedirect("cadastrar.jsp");

        }
}
    else
    {
        
    }

%>

