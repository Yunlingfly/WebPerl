#����ʵ��6
open (FH,'<apple tree.txt');	#���ļ�
my $text=<FH>;	#ֻ��һ��ֱ���ñ�����������
my @array=split(' ',$text);
my (@name,@number);
my $num=0;		#��¼�б���
my $code;		#��¼��ǰ�ַ�
my $vo;			#��¼Ҫ�Ƚϵ��ַ�
my $i;			#��־λ
foreach $code(@array){
	print $code." ";
	$i =grep /^$code$/, @name;
	if($i==0){foreach $vo(@array){	#���û�м�¼�õ�������м�¼
		if($code eq $vo){
			$name[$num]=$code;		#��¼����
			$number[$num]++;		#+1
		}
		}	#foreach
		$num++;		#�ô�ͳ�ƽ��� �ƶ�����һ���б�
	}#if
}
my $len=@name;	#���鳤��
for($j=0;$j<$len;$j++){	#ѭ������б�
	print "\n"."����:".$name[$j]." "."����:".$number[$j];
}
close FH;#�ر��ļ�