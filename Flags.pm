package B::Flags;

use B;

require 5.005_62;
use strict;
use warnings;

require DynaLoader;
our @ISA = qw(DynaLoader);

our $VERSION = '0.11';

bootstrap B::Flags $VERSION;

# Preloaded methods go here.

1;
__END__

=head1 NAME

B::Flags - Friendlier flags for B

=head1 SYNOPSIS

  use B::Flags;
  print B::main_root->flagspv;
  print B::main_root->privatepv;
  print $some_b_sv_object->flagspv;

=head1 DESCRIPTION

Stringification of flags.

By default, C<$foo-E<gt>flags> when passed an object in the C<B> class
will produce a relatively meaningless number, which one would need to
grovel through the Perl source code in order to do anything useful with.
This module adds C<flagspv> to the SV and op classes and C<privatepv> to
the op classes, which makes them easier to understand.

=head1 METHODS

=over

=item OP->flagspv

Returns stringification of the OP flags.

=item OP->privatepv

Returns stringification of the OP private flags.

=item SV->flagspv [type]

Returns stringification of the SV flags.

With the optional type only the flags for the given SvTYPE are used.
type 0 is for the SvFLAGS only.
This way you can seperate between sv->FLAGS and specialized AvFLAGS,
GvFLAGS, CvFLAGS, ... in seperate struct fields.

Note that only the names of bitmasked SV and OP flags are returned,
not pseudo flags, like TAINTED, which is stored as magic.

=back

=head1 AUTHOR

Simon Cozens, simon@cpan.org

=head1 MAINTAINER

Abhijit Menon-Sen, ams@cpan.org

Reini Urban, rurban@cpan.org

=head1 SEE ALSO

perl(1).

=head1 LICENSE

AL&GPL.
Copyright 2001 Simon Cozens
Copyright 2010,2013,2014 Reini Urban

=cut
