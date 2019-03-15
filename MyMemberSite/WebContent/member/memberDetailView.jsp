<%@page import="com.tg.member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>

<script type="text/javascript">
	function backPageFnc(){
		location.href = './list';
	}
	
	function deleteUserFnc() {
		var obj = document.getElementBy('no');
		
		var memberNo = obj.value;
		
		location.href = './delete?no=' + memberNo;
	}
</script>
</head>

<body>
	<%
// 		ArrayList<MemberDto> memberList =
// 			(ArrayList<MemberDto>)request.getAttribute("memberList");
// 		MemberDto memberDto = memberList.get(0);
		MemberDto memberDto = (MemberDto)request.getAttribute("MemberDtro");
	%>
	<jsp:include page="/Header.jsp"/>
	
	<h1><%=memberDto.getName()%> 회원정보 조회</h1>
	<form action="./update" method="post">
		번호: <input type="text" id ="no" name="no" value="<%=memberDto.getNo()%>" readonly="readonly"><br>
		이름: <input type="text" name='name' value="<%=memberDto.getName()%>"><br>
		이메일: <input type="text" name="email" value="<%=memberDto.getEmail()%>"><br>
		가입일: <%=memberDto.getCreateDate()%><br>
		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="deleteUserFnc();">
<%-- 		<input type="button" value="삭제" onclick="location.href='./delete?no=<%=memberDto.getNo()%>'"> --%>
		<input type="button" value="뒤로가기" onclick="location.href='./list'">
<!-- 		<input type="button" value="뒤로가기" onclick="backPageFnc();"> -->	
	</form>

	<jsp:include page="/Tail.jsp"/>

</body>

</html>