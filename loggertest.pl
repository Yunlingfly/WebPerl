#!/usr/bin/perl -w
#ʹ����Logger4perl
use Log::Log4perl::Level;
use Log::Log4perl qw(:easy);

#��ʼ�� log4perl �����ļ�
Log::Log4perl->init("log4perl.conf");

#���� log ʵ����info �������Ϣ��ģ�� Foo:Bar
our $log = Log::Log4perl::get_logger("Foo::Bar");
$log->info("����������ô����Ļ������������ˣ�");

#���� log ʵ����debug �������Ϣ��ģ�� Com::Unmi
my $log1 = Log::Log4perl::get_logger("Com::Unmi");
$log1->debug("Where���Ҵ�ӡ����Ϣ��ȥ�ˣ�");
$log->info("dajdja");