#!/usr/bin/perl
open DATA,">>file.txt" or die "file.txt �ļ��޷���, $!";
print "Content-type: text/html\n\n";
print "<html><head>\n";
print "<title> Display query string data </title></head>\n";
print "<body>\n";
$request_method=$ENV{'REQUEST_METHOD'};
if ($request_method eq "GET"){
     $query_string=$ENV{'QUERY_STRING'};
}
elsif ($request_method eq "POST"){
     read(STDIN,$query_string,$ENV{'CONTENT_LENGTH'});
}
else{
     print "Error - request method is illegal \n";
}

@name_value_pairs=split(/&/,$query_string);
foreach $name_value(@name_value_pairs){

#Split the pairs into names and values and translate the values
#into text (decode hex characters)

         ($name,$value)=split(/=/,$name_value);
         $value=~tr/+/ /;
         $value=~s/%([\dA-Fa-f][\dA-Fa-f])/pack("C",hex($1))/eg;

#         print "The next name/value pair is: $name, $value<br/>\n";

 if($name eq "favoriteSong") {
     print DATA "Favorite popular song:$value\n";
 } elsif ($name eq "Composer"){
     print DATA "Composer:$value\n";
 } elsif ($name eq "Performing"){
     print DATA "Performing artist or group:$value\n";
 }
}##- end of foreach
close DATA;
print "�ļ�д�����<br/><hr/>";
print "<h3>��ȡ�ļ�:</h3>";
open DATA,"<file.txt" or die "file.txt�ļ��޷���ȡ,$!";
 while($line=<DATA>){
          print "$line<br/>";
       }
       close f;
print "</body></html>";