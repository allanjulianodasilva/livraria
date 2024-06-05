import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/UploadDeArquivo")
public class UploadDeArquivo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UploadDeArquivo() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "Imagem enviada com sucesso";
        String path = request.getServletContext().getRealPath("/img");
        path = "C:\\livraria\\fotos";
        System.out.println(path);
        try {
            for (Part part : request.getParts()){
                if (part.getName().equals("foto")){
                    part.write(path+File.separator+"teste.png");
                }
            }
        } catch (Exception e) {
            System.out.println("ERRO!!!");
            System.out.println(e.getMessage());
            msg = "Erro ao salvar a imagem";
        }
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}