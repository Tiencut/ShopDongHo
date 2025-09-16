package test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class testfile
 */
@WebServlet("/testfile")
public class testfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "files";
		 response.getWriter().println(dirUrl1);
		 try {
			List<FileItem> fileItems = upload.parseRequest(request);
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			if (fileItems != null)
			for (FileItem fileItem : fileItems) {
				if (fileItem.getContentType() != null && !fileItem.isFormField()) { //Nếu ko phải các control=>upfile lên
					if (!fileItem.getContentType().equals("image/png")) continue;
					System.err.println(fileItem.getContentType());
					 String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						//Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "images";
						File dir = new File(dirUrl);
						if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
				        String fileImg = dirUrl + File.separator + nameimg;
				        File file = new File(fileImg);//tạo file
				        
				    
				        try {
				        	fileItem.write(file);
				        	Path source = Paths.get(fileImg);
				        	Files.move(source, source.resolveSibling("img1.png"));
				        	System.out.println("UPLOAD THÀNH CÔNG...!");
				            System.out.println("Đường dẫn lưu file là: " + dirUrl);
				        } catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else { //Neu la control
						String tentk=fileItem.getFieldName();
						if(tentk.equals("txthoten"))
							response.getWriter().println(fileItem.getString());
						if(tentk.equals("txtdiachi"))
							response.getWriter().println(fileItem.getString());
					}
			}
		
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
