use Log::Log4perl::Level;
use Log::Log4perl qw(:easy);

#初始化 log4perl 配制文件
Log::Log4perl->init("log4perl.conf");

#创建 log 实例，info 并输出信息，模块 Foo:Bar
our $log = Log::Log4perl::get_logger("Foo::Bar");

$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET") {
$query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST") {
read(STDIN,$query_string,
$ENV{'CONTENT_LENGTH'});
$log->info("$query_string");	#输出至日志

print <<EOF;
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body style="text-align: center; font-size: 16px;">
<strong>hello 你好</strong>
</body>
</html>
EOF
}
else {
print "Error-the request method is illegal \n";
exit(1);
}
