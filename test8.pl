#ʵ��8
use Encode;
my @pairs;
my @form_N;		#������
my @form_C;		#������
my @form_P;		#������
$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET") {
$query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST") {

read(STDIN,$query_string,
$ENV{'CONTENT_LENGTH'});
#д���ļ�
$query_string=~s/%([\dA-Fa-f][\dA-Fa-f])/pack("C",hex($1))/eg;
open (FH,'>>Songs.txt');
print FH "$query_string\n";
close FH;
#�����ļ�
open (FH,'<Songs.txt');
my $len=0;
while($line=<FH>){	#���ж�ȡ
	# �ָ��û�������
	@pairs=split('&',$line);
	# ��������
	foreach $pair(@pairs){
		($name,$value)=split('=',$pair);
		if($name eq 'tijiao'){next;}
		if($name eq 'Song_name'){$form_N[$len]=$value;}
		if($name eq 'Composer'){$form_C[$len]=$value;}
		if($name eq 'Performance_artist'){$form_P[$len]=$value;}
	}
	$len++;
}
close FH;


print "Content-type:text/html\n\n";#��������
print "<html>";
print "<head>";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />";
print "<title>�ޱ����ĵ�</title>";
print "</head>";

print "<body>";
print "<table width=\"434\" height=\"263\" border=\"1\" align=\"center\">";
print "<tr><td colspan=\"3\" align=\"center\">�б�����</td></tr>";
print "<tr><th scope=\"col\">������</th><th scope=\"col\">������</th><th scope=\"col\">����������</th></tr>";

$len=0;
my $n;
my $c;
my $p;

foreach $name(@form_N){	#ѭ����������
	$n=$form_N[$len];
	$c=$form_C[$len];
	$p=$form_P[$len];
	print "<tr>";
	print "<td align=\"center\">".$n."</td>";
	print "<td align=\"center\">".$c."</td>";
	print "<td align=\"center\">".$p."</td>";
	print "</tr>";
	$len++;
}
$len=@form_N;	#�ռ�����Ϣ����
print "<tr><td colspan=\"3\" align=\"center\">�ռ���Ϣ����Ϊ��$len</td></tr>";
print "</table>";
print "</body>";
print "</html>";
}
