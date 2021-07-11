/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.68
 * Generated at: 2021-07-01 06:16:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<meta name=\"description\" content=\"\">\r\n");
      out.write("<meta name=\"author\"\r\n");
      out.write("	content=\"Mark Otto, Jacob Thornton, and Bootstrap contributors\">\r\n");
      out.write("<meta name=\"generator\" content=\"Hugo 0.83.1\">\r\n");
      out.write("<title>header</title>\r\n");
      out.write("<link rel=\"canonical\"\r\n");
      out.write("	href=\"https://getbootstrap.com/docs/5.0/examples/headers/\">\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("	integrity=\"sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

		request.setCharacterEncoding("UTF-8");
		//String user_id = "admin";
		String user_id = (String)session.getAttribute("user_id");
		String display_none = "display:none";
		if (user_id.equals("admin"))
			display_none = "display:block";
	
      out.write("\r\n");
      out.write("	 <header class=\"p-3 bg-dark text-white\">\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("			<div\r\n");
      out.write("				class=\"d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start\">\r\n");
      out.write("				<a href=\"main.jsp?sideIdx=0\"><img src=\"images/moreco_logo.png\" class=\"logoimg\"\r\n");
      out.write("					style=\"width: 220px; height: 50px; margin:5px; margin-left:-40px;\"></a>\r\n");
      out.write("				<ul\r\n");
      out.write("					class=\"nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0\"></ul>\r\n");
      out.write("				<form class=\"col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3\">\r\n");
      out.write("					<input type=\"search\" class=\"form-control form-control-dark\"\r\n");
      out.write("						placeholder=\"Search\" aria-label=\"Search\">\r\n");
      out.write("				</form>\r\n");
      out.write("\r\n");
      out.write("				<div class=\"text-end\">\r\n");
      out.write("					<div class=\"btn-group\">\r\n");
      out.write("					<button type=\"button\" class=\"btn btn-danger\" style=\"");
      out.print(display_none);
      out.write("\" onClick=\"location.href='addmovie.jsp?sideIdx=8'\">Add</button>\r\n");
      out.write("						<button type=\"button\" class=\"btn btn-danger dropdown-toggle\"\r\n");
      out.write("							data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("							<img src=\"images/svg/user_white.svg\"\r\n");
      out.write("								style=\"width: 30px; height: 20px;\" />\r\n");
      out.write("						</button>\r\n");
      out.write("						<ul class=\"dropdown-menu\">\r\n");
      out.write("							<li><a class=\"dropdown-item\">");
      out.print(user_id );
      out.write("님</a></li>\r\n");
      out.write("							<li><a class=\"dropdown-item\" href=\"#\">회원 정보 변경</a></li>\r\n");
      out.write("							<li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("							<li><a class=\"dropdown-item\" href=\"logout.jsp\">로그아웃</a></li>\r\n");
      out.write("						</ul>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</header> \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
