                                                        <%@page import="java.sql.*"%>
                                                         <% 
                                                          String username = request.getParameter("username");
                                                            String password = request.getParameter("password");
                                                            try
                                                       {
                                                       Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
                                                       String sql="SELECT * FROM `womenwelfare` WHERE `email`='"+username+"' AND `password`='"+password+"'";
                                                              
                                                               PreparedStatement psmt=con.prepareStatement(sql);
                                                               ResultSet rs=psmt.executeQuery();
                                                              int f=0;
                                                              while(rs.next())
                                                               { 
                                                                 if(rs.getString("status").equals("1")) 
                                                                 {
                                                               f=1;
                                                                String value = rs.getString("OrganisationName");
                                                                Cookie nameu = new Cookie("user", value);
                                                                nameu.setMaxAge(2*24*60*60);
                                                                 response.addCookie(nameu);
                                                                 String value2 = rs.getString("id");
                                                                Cookie idu = new Cookie("id", value2);
                                                                idu.setMaxAge(2*24*60*60);
                                                                 response.addCookie(idu);
                                                               
                                                                 }
                                                                 else
                                                                 {
                                                                 f=2;
                                                                 }
                                                               
                                                               }
                                                               %>
                                                            <script>
                                                                var res=<%=f %>
                                                                if(res==0)
                                                                {
                                                                    alert("not found");
                                                                     window.location="WomenwelfareLogin.jsp";
                                                                }
                                                                if(res==1)
                                                                {
                                                                    
                                                                    window.location="welfare/index.jsp";
                                                                
                                                                }
                                                                if(res==2)
                                                                {
                                                                   alert("dear user your account is waiting for admin approval");
                                                                   window.location="WomenwelfareLogin.jsp";  
                                                                }
                                                                
                                                            </script>
                                                     <%
                                                                }
                                                       catch(Exception e)
                                                       {
                                                           out.print(e);
                                                       }
                                                           
                                                            %>
             
    