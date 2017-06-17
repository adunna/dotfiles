#!/usr/bin/env perl
use strict;
use warnings;
use JSON;
use File::Slurp;
$| = 1;
print scalar <STDIN>;
print scalar <STDIN>;
while (my ($statusline) = (<STDIN> =~ /^,?(.*)/)) {
	my @blocks = @{decode_json($statusline)};
	@blocks = ({
		full_text => read_file('/sys/class/backlight/intel_backlight/brightness'),
		name => "bl"
	}, @blocks);
	print encode_json(\@blocks) . ",\n";
}
