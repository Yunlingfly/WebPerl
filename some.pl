#! /usr/bin/perl
###############################################################
# �Ľ������԰�Դ��                                            #
#                                                             #
# ������ƣ�Skywind(��ΰ)                                     #
# Copyright (c) 1997,2000 NewBird                             #
###############################################################

use CGI;

my $v_name="(����)";
my $v_mail="";
my $v_comment="";
my $v_link="";
my $v_headfile="";
my $v_msgfile="";
my $v_user="";
my @chtml_text=(0);

my $c_title="NewBird���԰�";
my $c_welcome="��д�����Ľ�������";
my $c_user="";
my $c_wcolor="#339900";
my $c_bcolor="#ffffff";
my $c_image="";

my $paramp="";
my $filename="../msgbord.htm";
my $htmlname="../message.htm";
my $buffer="";

# ȡ���û����͵�����
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
read_cgi_param();
check_user();
}
else
{
read_param();
check_user();
view_message();
exit;
}

print "Content-type:text/html\n\n";
print "<html>\n";
print "<header>\n";
print "<title>�����ڴ�</title>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\n";
print "</head>\n";
print "<body bgcolor=\"#ffffff\">\n";
print "<div align=\"center\"> <h3>�û����԰�<hr> </div>\n";

if ($v_comment eq "")
{
print "<center>\n";
print "  �Բ���������<b>��������</b>!\n";
print "  <a href=\"message.pl$paramp\" onClick=history.back()>��˴�����</a>\n";
print "</center>\n";
exit;
}

($sec,$min,$hour,$day,$mon,$year)=localtime(time);

$mon++;
$year=$year+1900;
$date="$year��$mon��$day��$hourʱ$min��$sec��";

srand;
my $num=rand(1);
save_message();
print "<p align=\"center\">\n";
print "�Ľ������԰壬���Skywind<br>\n";
print "Copyright (c) 1997,2000 NewBird\n";
print "<a href=\"message.pl$paramp\" onClick=history.back()>��������</a>��\n</p>\n";
print "</body>\n</html>\n";

EXIT;

sub create_html_text()
{
@chtml_text=<<NEWHTML;
<html>
<head>
<title>$c_title</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
A:link {text-decoration: none; color: 0000cc} 
A:visited {text-decoration: none; color: 0000cc}
A:active {text-decoration: none; color: 0000cc}
A:hover {text-decoration: underline; color: f00000} 
</style>
</head>
<body bgcolor="$c_bcolor" background="$c_image">
<table width="99%" border="0" height="44">
  <tr> 
    <td colspan="2" height="46"> 
      <div align="center"><font size="5" color="$c_wcolor">$c_welcome</font></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <div align="center"><font size="2">�����԰������Skywind��д��Copyright (C) 1997,2000 
        NewBird</font></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2">
      <div align="center"><font size="2">�����԰�֧��HTML����</font></div>
    </td>
  </tr>
</table>
<table width="99%" border="0" height="101">
  <tr> 
    <td height="116"> 
      <form action="message.pl" method="post">
      <input type="hidden" name="user" value=$v_user>
        <div align="center"> 
          <table width="83%" border="1" height="86" cellspacing="0">
            <tr> 
              <td height="33" colspan="2"> 
                <div align="left"> <font size="2">��������</font> 
                  <input type="text" name="name" size="20">
                  <font size="2">�������� </font> 
                  <input type="text" name="email" size="20">
                  <font size="2"> <br>
                  ��ҳ���� 
                  <input type="text" name="link" size="20">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="86%"> 
                <div align="center"> 
                  <textarea row="7" cols="70" name="comment" rows="4"></textarea>
                </div>
              </td>
              <td width="14%"> 
                <div align="center"> 
                  <p> 
                    <input type="submit" name="submit" value="�ö�">
                    <br>
                  </p>
                  <p> 
                    <input type="reset" name="reset" value="��д">
                  </p>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </form>
    </td>
  </tr>
</table>
</body>
</html>

NEWHTML
}
sub view_message
{
if (open(FHTML,"<$htmlname"))
{
@html_text=<FHTML>;
close(FHTML);
}
else
{
create_html_text();
@html_text=@chtml_text;
}
print "Content-type:text/html\n\n";
print "@html_text\n";
open(FMSG,"<$filename");
@msg=<FMSG>;
close(FMSG);
print "@msg\n";
}
sub check_user
{
$paramp="";
if ($v_headfile ne "")
{
$htmlname=$v_headfile;
$paramp="head=$v_headfile";
}
if ($v_msgfile ne "")
{
$filename=$v_msgfile;
$paramp="msg=$v_msgfile";
if ($paramp ne "")
{
$paramp="$paramp&msg=$v_msgfile";
}
}
if ($v_user ne "")
{
$filename="data/$v_user.ld";
$htmlname="data/$v_user.lh";
$paramp="user=$v_user";
}
if ($paramp ne "")
{
$paramp="?$paramp";
}
}
sub save_message
{
open(FILE,"<$filename");
@old_content=<FILE>;
close(FILE);
open(OF,">$filename");
print OF "<p><font size=2>\n";
print OF "<b>����</b>:$v_name\n";
if ($v_mail ne "") 
{
print OF "<br>\n<b>����</b>:<a href=\"mailto:$v_mail\">$v_mail</a>\n";
}
print OF "<br>\n";
print OF "<b>����</b>:$ENV{'REMOTE_ADDR'}\n";
print OF "<b>ʱ��</b>:$date\n";
if ($v_link ne "") 
{
print OF "<br>\n<b>��ҳ</b>:<a href=\"$v_link\" target=\"_blank\">$v_link</a>\n";
}
print OF "<br><br></font>\n";
print OF "$v_comment\n";
print OF "<hr>\n";
print OF "</p>\n";
print OF "@old_content";
close(OF);
}

sub read_param
{
# ���ַ����д�
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
read(STDIN,$buffer,$ENV{'CONTENT_LENGTH'});
}
elsif($ENV{'REQUEST_METHOD'} eq "GET")
{ 
$buffer=$ENV{'QUERY_STRING'};
}
# �ָ��û�������
@pairs=split(/&/,$buffer);
# ��������
foreach $pair(@pairs)
{
($name,$value)=split(/=/,$pair);
$value=~tr/+//;
$value=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
$name=~tr/+//;
$name=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
$FORM{$name}=$value;
}
$FORM{'comment'}=~s/\cM\n/<br>\n/g;
$FORM{'comment'}=~s//&nbsp;/g;
$v_name=$FORM{'name'};
$v_mail=$FORM{'email'};
$v_comment=$FORM{'comment'};
$v_headfile=$FORM{'head'};
$v_msgfile=$FORM{'msg'};
$v_user=$FORM{'user'};
}

sub read_cgi_param
{
# ������ȷ��˼·
my $cgi=new CGI;
$v_name=$cgi->param("name");
$v_mail=$cgi->param("email");
$v_link=$cgi->param("link");
$v_headfile=$cgi->param("head");
$v_msgfile=$cgi->param("msg");
$v_user=$cgi->param("user");
$v_comment=$cgi->param("comment");
$v_comment=~s/\cM\n/<br>\n/g;

$c_title=$cgi->param('ctitle');
$c_welcome=$cgi->param('cwelcome');
$c_user=$cgi->param('cuser');
$c_wcolor=$cgi->param('cwcolor');
$c_bcolor=$cgi->param('cbcolor');
$c_image=$cgi->param('cimage');
}