import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carregadorImagem")
public class CarregadorImagem extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private static FileInputStream fileInputStream;

    public CarregadorImagem() {
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        String foto = request.getParameter("id");// vem do jsp

        //camininho da imagem;
        byte[] imageData = carregarImagem("C:\\livraria\\fotos\\"+foto+".png");

        response.setContentType("image/jpeg");
        response.getOutputStream().write(imageData);      
    }

    private static byte[] carregarImagem(String path) throws  IOException {

        byte[] image;
        File file = new File(path);//monta imagem baseada no path
        image = new byte[(int)file.length()]; 

        fileInputStream = new FileInputStream(file);
        fileInputStream.read(image);

        return image;
    }
}