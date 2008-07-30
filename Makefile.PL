######################################################################
# Makefile.PL for LWP::UserAgent::POE
# 2008, Mike Schilli <cpan@perlmeister.com>
######################################################################
use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'LWP::UserAgent::POE',
    'VERSION_FROM' => 'POE.pm', # finds $VERSION
    'PREREQ_PM'    => {
        POE                           => "0.9999",
        POE::Component::Client::HTTP  => 0.83,
        HTTP::Request                 => 0,
        Log::Log4perl                 => 1,
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'POE.pm',
       AUTHOR     => 'Mike Schilli <cpan@perlmeister.com>') : ()),
);
