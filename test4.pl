#ʵ��4
my @pairs;
my @form_name;
my @form_value;
my $count;
$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET") {
$query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST") {
read(STDIN,$query_string,
$ENV{'CONTENT_LENGTH'});
# �ָ��û�������
@pairs=split('&',$query_string);
my $len=0;
# ��������
foreach $pair(@pairs){
	($name,$value)=split('=',$pair);
	if($name eq 'name'){next;}
	if($name eq 'button'){next;}
	if($name eq 'RadioGroup1'){next;}
	$form_name[$len]=$name;
	$form_value[$len]=$value;
	$count+=$value;
	$len++;
}

print "Content-type:text/html\n\n";#��������
print "<html>";
print "<head>";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />";
print "<title>�ޱ����ĵ�</title>";
print "</head>";

print "<body>";
print "<table width=\"434\" height=\"263\" border=\"1\" align=\"center\">";
print "<tr>";
print "<th scope=\"col\">����</th><th scope=\"col\">�۸�</th>";
print "</tr>";
$len=0;
foreach $name(@form_name){	#ѭ����������
	my $some;
	if($name eq 'CheckboxGroup1'){$some="Four 100-watt light bulbs";}
	elsif($name eq 'CheckboxGroup2'){$some="Eight 100-watt light bulbs";}
	elsif($name eq 'CheckboxGroup3'){$some="Four 100-watt long-life light bulbs";}
	elsif($name eq 'CheckboxGroup4'){$some="Eight 100-watt long-life light bulbs";}
	print "<tr>";
	print "<td>".$some."</td>";
	print "<td>".$form_value[$len]."</td>";
	print "</tr>";
	$len++;
}
print "<tr><td colspan=\"2\" align=\"center\">����Ϊ��$count</td></tr>";
print "<tr><td colspan=\"2\" align=\"center\">����Ҫ֧����".($count+$count*0.062)."</td></tr>";
print "</table>";
print "</body>";
print "</html>";
}
