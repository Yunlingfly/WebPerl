#实验3
print "Content-type: text/html ";
print<<EOF;
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<form name="form1" method="post" action="http://115.159.115.102:8080/cgitest/cgi-bin/test4.pl">
  <p>
    <label for="name">请输入你的名字：</label>
    <input type="text" name="name" id="name">
  </p>
  <p>
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="2.39" id="CheckboxGroup1_0">
      Four 100-watt light bulbs for $2.39</label>
    <br>
    <label>
      <input type="checkbox" name="CheckboxGroup2" value="4.29" id="CheckboxGroup1_1">
      Eight 100-watt light bulbs for $4.29</label>
    <br>
    <label>
      <input type="checkbox" name="CheckboxGroup3" value="3.95" id="CheckboxGroup1_2">
      Four 100-watt long-life light bulbs for $3.95</label>
    <br>
    <label>
      <input type="checkbox" name="CheckboxGroup4" value="7.49" id="CheckboxGroup1_3">
      Eight 100-watt long-life light bulbs for $7.49</label>
    <br>
<br>
    <label>
      <input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0">
      Visa</label>
    <br>
    <label>
      <input type="radio" name="RadioGroup1" value="2" id="RadioGroup1_1">
      Master Charge</label>
    <br>
    <label>
      <input type="radio" name="RadioGroup1" value="3" id="RadioGroup1_2">
      Discover</label>
    <br>
  </p>
  <p>
    <input type="submit" name="button" id="button" value="提交">
    <br>
  </p>
</form>
</body>
</html>
EOF
