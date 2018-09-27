#实验8
use Encode;
my @pairs;
my @form_N;		#歌曲名
my @form_C;		#作曲家
my @form_P;		#表演者
$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET") {
$query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST") {

read(STDIN,$query_string,
$ENV{'CONTENT_LENGTH'});
#写入文件
$query_string=~s/%([\dA-Fa-f][\dA-Fa-f])/pack("C",hex($1))/eg;
open (FH,'>>Songs.txt');
print FH "$query_string\n";
close FH;
#读出文件
open (FH,'<Songs.txt');
my $len=0;
while($line=<FH>){	#逐行读取
	# 分割用户的数据
	@pairs=split('&',$line);
	# 解码数据
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


print "Content-type:text/html\n\n";#这句必须有
print "<html>";
print "<head>";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />";
print "<title>无标题文档</title>";
print "</head>";

print "<body>";
print "<table width=\"434\" height=\"263\" border=\"1\" align=\"center\">";
print "<tr><td colspan=\"3\" align=\"center\">列表如下</td></tr>";
print "<tr><th scope=\"col\">歌曲名</th><th scope=\"col\">作曲家</th><th scope=\"col\">表演艺术家</th></tr>";

$len=0;
my $n;
my $c;
my $p;

foreach $name(@form_N){	#循环输出到表格
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
$len=@form_N;	#收集的信息条数
print "<tr><td colspan=\"3\" align=\"center\">收集信息总数为：$len</td></tr>";
print "</table>";
print "</body>";
print "</html>";
}
