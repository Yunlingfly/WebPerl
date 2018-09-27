use Log::Log4perl::Level;
use Log::Log4perl qw(:easy);

#��ʼ�� log4perl �����ļ�
Log::Log4perl->init("log4perl.conf");

#���� log ʵ����info �������Ϣ��ģ�� Foo:Bar
our $log = Log::Log4perl::get_logger("Foo::Bar");

$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET") {
$query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST") {
read(STDIN,$query_string,
$ENV{'CONTENT_LENGTH'});
$log->info("$query_string");	#�������־

print <<EOF;
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ޱ����ĵ�</title>
</head>

<body style="text-align: center; font-size: 16px;">
<strong>hello ���</strong>
</body>
</html>
EOF
}
else {
print "Error-the request method is illegal \n";
exit(1);
}
