#这是实验6
open (FH,'<apple tree.txt');	#打开文件
my $text=<FH>;	#只有一行直接用标量保存数据
my @array=split(' ',$text);
my (@name,@number);
my $num=0;		#记录列表长度
my $code;		#记录当前字符
my $vo;			#记录要比较的字符
my $i;			#标志位
foreach $code(@array){
	print $code." ";
	$i =grep /^$code$/, @name;
	if($i==0){foreach $vo(@array){	#如果没有记录该单词则进行记录
		if($code eq $vo){
			$name[$num]=$code;		#记录单词
			$number[$num]++;		#+1
		}
		}	#foreach
		$num++;		#该次统计结束 移动到下一个列表
	}#if
}
my $len=@name;	#数组长度
for($j=0;$j<$len;$j++){	#循环输出列表
	print "\n"."单词:".$name[$j]." "."次数:".$number[$j];
}
close FH;#关闭文件