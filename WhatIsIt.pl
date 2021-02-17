#!/usr/bin/perl -w

# Theodore Gouskos:      <-------------------Enter your name here

use strict;
use DBI;
use v5.14;
use POSIX;	# you need this to get the system date

sub isItAnInteger {		# a positive or negative integer with no leading zeroes
	$_ = $_[0];
	/\A-?[123456789][0123456789]*\z/ or /\A0\z/
}

sub isItARealNumber {	# a positive or negative real number, leading zeroes allowed
	$_ = $_[0];
	/\A-?[0123456789]*(\.[0123456789]*)?\z/	and /\d/
}

sub isItFriendliness {	# a single digit between 1 and 5 inclusive
	$_ = $_[0];
	/\A[12345]\z/				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItSecurityClearance {	# an integer between 1 and 10 inclusive
	$_ = $_[0];
	/\A([123456789]|[1][0])\z/				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItGender {	# either M or F
	$_ = $_[0];
	/\A[M|F]\z/				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}
sub isItNonBlank {	# a non-empty string - any non-white space will do
	$_ = $_[0];
	/\S+/				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItPassword {	# a valid password - at least 6 characters - has a letter - has a digit
	$_ = $_[0];
	/.{6,}/ and /[a-z]+/ and /[0-9]+/			# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItMoney {		# a positive real number with exactly 2 digits after the decimal
	$_ = $_[0];
	/\A[0123456789]{1,2}/ and /\.[0123456789]{2,2}\z/ and /\d/		# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItSpecies {	# see list of valid species on Moodle
	$_ = $_[0];
	/\A(feline|snake|lizard|giraffe|penguin|panda|elephant|Whale|parrot|flamingo|dolphin|koala|gorilla|sea lion|starfish|alligator|octopus)\z/
				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isAValidDate{
	$_ = $_[0];
	/(\A[1][123456789][123456789][123456789]|[2][0][01][12345678])\-[0][123456789]|[1][12]\-[0][123456789]|[12][123456789]-\z/ # REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

sub isItDate {		# a valid date of the form YYYY-MM-DD prior to today
	$_ = $_[0];
	isAValidDate($_);				# REPLACE THIS LINE WITH THE APPROPRIATE REGULAR EXPRESSION
}

my $x;
print "\nEnter something and I'll tell you what it is (ctrl-d to end): ";
while (<STDIN>){
	chomp;
	if (isItAnInteger($_)){
		print "$_ is an integer.\n";
	};
	if (isItARealNumber($_)){
		print "$_ is a real number.\n";
	};
	if (isItFriendliness($_)){
		print "$_ is a friendliness value.\n";
	};
	if (isItSecurityClearance($_)){
		print "$_ is a security clearance value.\n";
	};
	if (isItGender($_)){
		print "$_ is either \'M\' or \'F\'.\n";
	};
	if (isItNonBlank($_)){
		print "$_ is non-blank.\n";
	};
	if (isItPassword($_)){
		print "$_ is a valid password.\n";
	};
	if (isItMoney($_)){
		print "$_ is money.\n";
	};
	if (isItSpecies($_)){
		print "$_ is a species.\n";
	};
	if (isItDate($_)){
		print "$_ is a date before today.\n";
	};

	print "\nEnter something else and I'll tell you what it is (ctrl-d to end): ";
}
print "\nThe End!\n";
