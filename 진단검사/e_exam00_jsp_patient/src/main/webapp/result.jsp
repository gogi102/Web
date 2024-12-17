<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<%
	String sql = "select r.P_NO, P_NAME, t_name, to_char(T_SDATE, 'YYYY-MM-DD'), case T_STATUS when '1' then '검사중' when '2' then '검사완료' end as status, to_char(T_LDATE, 'YYYY-MM-DD'), case T_RESULT when 'X' then '미입력' when 'P' then '양성' when 'N' then '음성' end as result FROM TBL_RESULT_202004 r, TBL_PATIENT_202004 p, TBL_LAB_TEST_202004 l where r.p_no = p.p_no and r.t_code = l.t_code order by p_name asc";
	
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
		<h2>검사결과조회</h2>
		<br>
		<table id = "table_line">
			<tr>
				<th>환자번호</th>
				<th>환자성명</th>
				<th>검사종류</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사종료일</th>
				<th>검사결과</th>
			</tr>
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
				</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>