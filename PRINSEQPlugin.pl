#!/usr/local/bin/perl
use warnings;
use strict;
use Getopt::Long; 

use lib '.';
use PerlPluMA;
use PerlIO;

my ($inputfile, $dograph, $cmd);
#my ($inputfilename1,$inputfilename2 ,$outputfilename, $base,$col, $delim,$delim2,$printdelim, $printCols,$headerRowFile1,$headerRowFile2,$headerRowFile1toPrint,$term); 
my %params;

# perl prinseq-lite.pl -verbose -fastq example/example1.fastq -graph_data example/example1.gd -out_good null -out_bad null
# perl prinseq-graphs.pl -i example/example1.gd -png_all -o example/example1

sub input {
	#$fastqfile = $_[0];
	%params = PerlIO::readParameters(@_[0]);
	$inputfile = PerlPluMA::prefix."/".$params{"inputfile"};
	$dograph = $params{"dograph"};
	#$inputfilename1=PerlPluMA::prefix."/".$params{"fastq"};
	#$inputfilename2=PerlPluMA::prefix."/".$params{"database"};
	##$outputfilename=$;
	##$col=$ARGV[2];
	#$delim=$params{"delim1"};
	#$delim2=$params{"delim2"};
	#$printdelim=$params{"printdelim"};
	#$headerRowFile1=$params{"headerRowFile1"};
	#$headerRowFile2=$params{"headerRowFile2"};
	#$headerRowFile1toPrint=$params{"headerRowFile1toPrint"};
}

sub run {}

sub output {
    if ($dograph == 1) {
       $cmd = `perl plugins/PRINSEQ/prinseq-graphs.pl -i $inputfile -png_all -o $_[0]`;
    }
    else {
    $cmd = `perl plugins/PRINSEQ/prinseq-lite.pl -verbose -fastq $inputfile -graph_data $_[0] -out_good null -out_bad null`;
    }
    print $cmd;
}

