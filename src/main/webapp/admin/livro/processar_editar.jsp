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
            String idNameFile = "";

            //Outros campos do form
            String titulo  = up.getForm().get("titulo") + "";
            String autor   = up.getForm().get("autor") + "";
            String foto_atual   = up.getForm().get("foto_atual") + "";
            // String editora = up.getForm().get("editora") + "";
            int editora_id = Integer.valueOf(up.getForm().get("editora") + "");
            
            int numero_arquivos = up.getFiles().size();
            out.print(numero_arquivos + "");
            if (numero_arquivos > 0){
                foto_atual  = up.getForm().get("foto_atual") + "";
            }

            if (up.getFiles().size() > 0) {
                String nameFile = up.getFiles().get(0);
                idNameFile = nameFile.substring(0,nameFile.lastIndexOf("."));
            }
            else {
                idNameFile = foto_atual;
            }
            out.print(idNameFile);
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
   
%>

