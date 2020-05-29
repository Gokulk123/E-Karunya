<%@page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page errorPage="ErrorPage.jsp" %>

<%
    String name="";
     String FileType="";
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");

    // Verify the content type
    String contentType = request.getContentType();

    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {

                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    //Get Extension
                    int beginIndex=0;
                    int endIndex=0;
                    
                    beginIndex=fileName.lastIndexOf('.')+1;
                    endIndex=fileName.length();
                    
                    FileType=fileName.substring(beginIndex, endIndex);
                    
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    out.println("Uploaded Filename: " + filePath
                            + fileName + "<br>");
String cookieValue="";
  String cookieid="";
  Cookie[] cookies = request.getCookies();
 for(int j = 0; j < cookies.length; j++)
  {
   Cookie cookie = cookies[j];
   String cookieName = cookie.getName();
   if(cookieName.equals("Adid"))
    {
   cookieValue = cookie.getValue();
    }
   
  }
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya", "root", "");
                    PreparedStatement psmt = Con.prepareStatement ("UPDATE `adoption` SET `Ad_Document`='"+fileName +"' WHERE `Ad_Id`='"+cookieValue+"'");                    int rows = psmt.executeUpdate();
                    out.print(rows + " added successfully!!!");
                    name=fileName;
                }

            }
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    } else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
%>
<script>
    alert("<%=name %> added successfully please wait for the admin call !!!");
    window.location="adoptionform2.jsp";
   </script> 