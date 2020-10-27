use strict;
use warnings;
for(;;){
	
print ("\n	 AddressBook \n");
print("Please choice one of the following Options: \n");
print("Add a new entry            1\n");
print("Delete an existing entry   2\n");
print("Whole address book detail  3\n");
print("Searching                  4\n");
print("Update an existing entry   5\n");
print("Exit                       6\n");

my $input = <>;
chop ($input);

if($input){
	
	if ( $input == 1 ){
		print("Adding Entry\n");
		print("Enter Full Name=>");
		my $FName=<>;
		chop($FName);
		print("Enter Ph Number=>");
		my $phNo=<>;
		chop($phNo);
		print("Enter Address line1=>");
		my $address=<>;
		chop($address);
		print("Enter Address line2=>");
		my $address1=<>;
		chop($address1);
		print("Enter City Name=>");
		my $city=<>;
		chop($city);
		open(FHR,">>addressbook.txt") or die "cannot open file or error $!";
		print FHR "$FName,$phNo,$address,$address1,$city\n";
		close(FHR);
	  }
	if( $input == 2 ) {
		print("Deleting Entry\n");
		print("Enter the name of person you want to Remove from the Address Book=>");
		my $name=<>;
		chop($name);
		open(my $store,"<addressbook.txt") or die "Cannot open file or error $!";
		my @File_lines;
		while(<$store>){
			chomp;
			push @File_lines, split /"\n"/;
		}
		close($store);
		open( FILE, ">addressbook.txt" )or die "cannot open file or error $!";
		foreach my $LINE (@File_lines ) { 
			print FILE "$LINE\n" unless ( $LINE =~ m/$name/ ); 
		} 
		close(FILE);
		}
	if ( $input == 3 ) {
		print("\nLets see whole Address Book\n");
		open(FHR,"addressbook.txt") or die "Cannot open file or error $!";
		while(<FHR>){
			print("$_");
		}
		close(FHR);
	 }
	if( $input == 4 ) {
		print("\nSearching\n");
		print("Enter Name of Person you want to find=>");
		my $name=<>;
		chop($name);
		open(FHR,"addressbook.txt") or die "Cannot open file or error $!";
		while(my $str=<FHR>) { 
			if($str =~ /$name/) 
			{ 
				print("$str\n");
				 
			} 
			
		}
			
		close(FHR);

	}
	if($input==5){
		print("Update");
		print("Enter the name of person you want to Update from the Address Book=>");
		my $name=<>;
		chop($name);
		open(my $store,"<addressbook.txt") or die "Cannot open file or error $!";
		my @File_lines;
		while(<$store>){
			chomp;
			push @File_lines, split /"\n"/;
		}
		close($store);
		print("Enter Full Name=>");
		my $FName=<>;
		chop($FName);
		print("Enter Ph Number=>");
		my $phNo=<>;
		chop($phNo);
		print("Enter Address line1=>");
		my $address=<>;
		chop($address);
		print("Enter Address line2=>");
		my $address1=<>;
		chop($address1);
		print("Enter City Name=>");
		my $city=<>;
		chop($city);
		open( FILE, ">addressbook.txt" )or die "cannot open file or error $!";
		foreach my $LINE (@File_lines ) { 
			if($LINE =~ m/$name/){
				print FILE "$FName,$phNo,$address,$address1,$city\n";
			}
			else{
			print FILE "$LINE\n"  
			}
		}
		
		close(FILE);
		
	}
	if ( $input == 6 ) {
		print("have a good day ahead sir/mam!!!");
		last;
	}

	}
	
}