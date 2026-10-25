# Make asciiquarium draw on the terminal's own background instead of ANSI black.
#
# Term::Animation pairs every color with COLOR_BLACK, which in Nord is #3b4252
# (nord1), so the aquarium sat on a lighter slab instead of #2e3440. This swaps
# the background for -1 (the terminal default). Loaded via the asciiquarium
# alias in .zshrc, so the Homebrew install stays untouched.
package DefaultBg;
use strict;
use warnings;
use Curses;
require Term::Animation;

no warnings 'redefine';
*Term::Animation::_set_colors = sub {
	my ($self) = @_;
	use_default_colors();
	my $cid = 1;
	for my $f ('w', 'r', 'g', 'b', 'c', 'm', 'y', 'k') {
		my $c = uc(Term::Animation::color_name($f));
		init_pair($cid, eval "Curses::COLOR_$c", -1);
		$self->{COLORS}{$f} = COLOR_PAIR($cid);
		$cid++;
	}
};

1;
