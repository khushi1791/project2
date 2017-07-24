#!C:\wamp\bin\perl\bin\perl.exe -T
 
use strict;
use warnings FATAL => 'all';
use CGI::Carp qw(fatalsToBrowser);
use DBI;
use DBD::mysql;
 
my $cgi = CGI->new;
print $cgi->header, $cgi->start_html;
 
my $head     = $cgi->param('head');

my $subhead  = $cgi->param('subhead');
my $fname    = $cgi->param('fname');
my $lname     = $cgi->param('lname');
my $home     = $cgi->param('home');
my $database = "test";
my $host     = "localhost";
my $user     = "root";
my $pw       = "";
my $dsn      = "dbi:mysql:$database:localhost:80";
my $dbh      = DBI->connect($dsn, $user, $pw,
                           { RaiseError => 1 })
            or die "unable to connect:$DBI::errstr\n";
 
my $query = "INSERT INTO test VALUES ('$fname','$lname','$home')";
my $sth   = $dbh->prepare($query); 
 
$sth->execute($head, $subhead);
 
# additional processing as needed ...
 
print $cgi->end_html;