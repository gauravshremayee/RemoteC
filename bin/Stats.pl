#!/usr/bin/perl
use XML::Simple;
my $arr;
my $timestamp;
my $doc=" ";
my $name;
my $value;
my $xs1 = XML::Simple->new();	
my $temp_xml_file="jambala1.xml";
$doc = $xs1->XMLin($temp_xml_file);		# read the entire xml file into a single string (doc) 
	$arr = $doc->{md}->{mi}->{mv};		# fetch array of hashes from doc
	$timestamp = $doc->{md}->{mi}->{mts}; 	# obtain the timestamp straight from the xml file 


        
        #print "timsestamp is $timestamp\n";
	foreach  $a (@$arr) {



		$name = $a->{moid};
		$value = $a->{r};
                #print  "name is $name and value is $value\n";

		if ($name =~ /Total-Requests.+Proc.+/) {
			$inapRequests += $value; 
                   print "Total-Request is $inapRequests\n";
		}
		elsif ($name =~ /Total-Results.+Proc.+/) {
			$inapResponses += $value; 
                   print "Total result is $inapResponses\n";
		}
		elsif ($name =~ /AppReqReceived.+Proc.+/) {
                       
			$diamRequests += $value; 
                    print "App request recieve is $diamRequests\n";
		}
		elsif ($name =~ /AppReqAnswered.+Proc.+/) {
			$diamResponses += $value;
                     print "App request Answered is $diamResponses\n"; 
		}
		#elsif ($name =~ /CdrOutput-Encoded-Successful.+Proc.+/) {
               elsif ($name =~ /Cdr-Encoded-Successful.+Proc.+/) {
			$cdrEncodedSuccess += $value; 
                  print "Cdr ouptput Encoded successful is $cdrEncodedSuccess\n";
		}
		elsif ($name =~ /RelayEvent-DirectDebit-Successful.+_SYSTEM/) {
			$relayEventSuccess += $value; 
                        print "Relay Event Direct Debit Successful is $relayEventSuccess\n";
		}
		elsif ($name =~ 
		  /CcnCounters=(.+?(Failed|Failure|Error|fail|error).*?),\s+Source\s+=\s+_SYSTEM/) {

                                print "Stats Value is $value and Upper Bound is $thresholdHash{$testCase}{upperBound} \n";
                                print  "Stats value is $value\n";
			} 
		}


         

