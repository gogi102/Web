<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<%
	String sql = "select p_city, case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as city, count(*) from tbl_patient_202004 t, tbl_result_202004 r where t.p_no = r.p_no group by p_city order by p_city";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<section id = "main-section">
		<h2>환자조회</h2>
		<br>
		<table id = "table_line">
			<tr>
				<th>지역코드</th>
				<th>지역명</th>
				<th>검사건수</th>
			</tr>
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>