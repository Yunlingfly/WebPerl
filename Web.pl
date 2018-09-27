#使用EOF输出大量HTML代码
print "Content-type: text/html ";
print<<EOF;
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body style="text-align: center; font-size: 16px;">
<strong style="font-size: 24px">在线教学管理系统</strong>
<table width="200" height="69" border="0" align="right">
  <tr>
    <th scope="col">欢迎你~</th>
  </tr>
</table>
<form method="POST" action="http://localhost:8080/cgitest/cgi-bin/sayhello.pl">
<p align="center">name：<input type="text" name="name" size="20"></p> 
<p align="center">passwd：<input type="password" name="passwd" size="20"></p> 
<input type="submit" value="提交" name="d"></p>
</form>
</body>
</html>
EOF
