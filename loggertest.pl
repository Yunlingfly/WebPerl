#!/usr/bin/perl -w
#使用了Logger4perl
use Log::Log4perl::Level;
use Log::Log4perl qw(:easy);

#初始化 log4perl 配制文件
Log::Log4perl->init("log4perl.conf");

#创建 log 实例，info 并输出信息，模块 Foo:Bar
our $log = Log::Log4perl::get_logger("Foo::Bar");
$log->info("看看，我怎么在屏幕上输出来两次了！");

#创建 log 实例，debug 并输出信息，模块 Com::Unmi
my $log1 = Log::Log4perl::get_logger("Com::Unmi");
$log1->debug("Where，我打印的信息哪去了！");
$log->info("dajdja");