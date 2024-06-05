<%-- 
    Document   : enviado
    Created on : 07/03/2016, 17:45:10
    Author     : marcelosiedler
--%>


<%@page import="util.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
        String path = "C:/livraria/fotos";
        Upload up = new Upload();
        up.setFolderUploadIsAbsolute(true);
        up.setFolderUpload(path);
        if(up.formProcess(getServletContext(), request))
        {
           
            //Arquivos
            String nameFile = up.getFiles().get(0);
       		String idNameFile = nameFile.substring(0,nameFile.lastIndexOf("."));
            //Outros campos do form
            String nome  = up.getForm().get("txtNome") + "";
            String email = up.getForm().get("txtEmail") + "";
            
            out.print(nome+ "<br/>");
            out.print(email+ "<br/>");

            out.print("<img  src='/livraria/carregadorImagem?id="+idNameFile+"' width='100' height='100'  />");
       }
       else
       {
           
       }
%>