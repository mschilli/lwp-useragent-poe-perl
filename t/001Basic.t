######################################################################
# Test suite for LWP::UserAgent::POE
# by Mike Schilli <cpan@perlmeister.com>
######################################################################
use warnings;
use strict;

use Test::More;
use Log::Log4perl qw(:easy);
use LWP::UserAgent::POE;
use POE;

plan tests => 2;
#sub POE::Kernel::ASSERT_DEFAULT () { 1 }

my $ticks = 0;

#Log::Log4perl->easy_init($INFO);

POE::Session->create(
  inline_states => {
    _start => sub { 
                $_[KERNEL]->yield("next");
                urlfetch();
              },
    next   => sub {
                $_[KERNEL]->delay(next => .01);
                $ticks++;
    },
    theend => sub {
                exit 0;
              },
  },
);

POE::Kernel->run();

###########################################
sub urlfetch {
###########################################
   my $ua = LWP::UserAgent::POE->new();
   my $resp = $ua->get( "http://www.yahoo.com" );

   my $code = $resp->code();
   like($code, qr/^(200|500)$/, "Return code");
   ok($ticks != 0, "number of ticks != 0 ($ticks)");
   $poe_kernel->yield("theend");
}
