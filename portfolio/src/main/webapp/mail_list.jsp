<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<ArrayList<String>> alldata = (ArrayList<ArrayList<String>>)request.getAttribute("alldata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead style="width:900px; height:30px" align="center">
		<tr style="width:100px">번호</tr>
		<tr style="width:450px">제목</tr>
		<tr style="width:200px">의뢰인 메일주소</tr>
		<tr style="width:150px">의뢰일자</tr>
	</thead>
	<%
	int w = 0;
	int no = Integer.parseInt(alldata.get(0).get(5));
	while(w < alldata.size()){
		
		String sj = "";
		// 제목 길이 제한 15자 이상이 되었을 경우 => 말 줄임표를 사용함
		if(alldata.get(w).get(3).length() > 15){
			sj = alldata.get(w).get(3).substring(0,15) + "...";
		}else{
			sj = alldata.get(w).get(3);
		}
	%>
	
	<tbody style="height:30px">
	<tr>
		<td><%=no %></td>
		<td align="Left" title="<%=alldata.get(w).get(3) %>"><%=sj %>
		<input type="button" value="삭제" onclick="mail_delete('<%=alldata.get(w).get(0) %>')">
		</td>
		<td><%=alldata.get(w).get(1) %>(<%=alldata.get(w).get(2) %>)</td>
		<td><%=alldata.get(w).get(4).substring(0,10) %></td>
	</tr>
	<%
	no--;
	}
	%>
	</tbody>
</table>

</form>
</body>
<script>
function mail_delete(n){
//	console.log(n);
	if(confirm("해당 게시물을 삭제 시 데이터 복구되지 않습니다.")){
		location.href='./mail_data'
	}
}
</script>
</html>