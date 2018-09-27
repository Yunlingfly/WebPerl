my @arr3 = qw(str1 str2 str3 str4 str11);
my $str = "str1";
my $aa="jk";
my @text=qw(jk jkjk jk lk);
my $result =grep /^$str$/, @arr3;
my @result2 =grep /^$str/, @arr3;
print "grep result=$result \n";         	# 返回个数
print "grep result2=@result2 \n";   	    # 返回元素

$result =grep /^$aa$/, @text;
print "grep result=$result \n";         	# 返回个数