package Locale::TextDomain::OO::Util::Constants; ## no critic (TidyCode)

use strict;
use warnings;
use Moo;
use MooX::StrictConstructor;
use charnames qw(:full);
use namespace::autoclean;

our $VERSION = '2.001';

with qw(
    MooX::Singleton
);

sub lexicon_key_separator {
    return q{:};
}

sub msg_key_separator {
    my ( undef, $format ) = @_;

    defined $format
        or return "\N{END OF TRANSMISSION}";
    $format eq 'JSON'
        and return '{MSG_KEY_SEPARATOR}';

    return "\N{END OF TRANSMISSION}";
}

sub plural_separator {
    my ( undef, $format ) = @_;

    defined $format
        or return "\N{NULL}";
    $format eq 'JSON'
        and return '{PLURAL_SEPARATOR}';

    return "\N{NULL}";
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME
Locale::TextDomain::OO::Util::Constants - Lexicon constants

$Id: Constants.pm 527 2014-10-18 11:01:51Z steffenw $

$HeadURL: svn+ssh://steffenw@svn.code.sf.net/p/perl-gettext-oo/code/Locale-TextDomain-OO-Util/trunk/lib/Locale/TextDomain/OO/Util/Constants.pm $

=head1 VERSION

2.001

=head1 DESCRIPTION

This module provides lexicon constants.

=head1 SYNOPSIS

    use Locale::TextDomain::OO::Util::Constants;

    my $const = Locale::TextDomain::OO::Util::Constants->instance;

=head1 SUBROUTINES/METHODS

=head2 method lexicon_key_separator

    $separator = $const->lexicon_key_separator;

=head2 method msg_key_separator

    $separator = $const->msg_key_separator; # Perl
    $separator = $const->msg_key_separator('JSON');

=head2 method plural_separator

    $separator = $const->plural_separator; # Perl
    $separator = $const->plural_separator('JSON');

=head1 EXAMPLE

Inside of this distribution is a directory named example.
Run this *.pl files.

=head1 DIAGNOSTICS

none

=head1 CONFIGURATION AND ENVIRONMENT

none

=head1 DEPENDENCIES

L<Moo|Moo>

L<MooX::StrictConstructor|MooX::StrictConstructor>

L<charnames|charnames>

L<namespace::autoclean|namespace::autoclean>

=head1 INCOMPATIBILITIES

not known

=head1 BUGS AND LIMITATIONS

none

=head1 SEE ALSO

L<Locale::TextDoamin::OO|Locale::TextDoamin::OO>

=head1 AUTHOR

Steffen Winkler

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2014,
Steffen Winkler
C<< <steffenw at cpan.org> >>.
All rights reserved.

This module is free software;
you can redistribute it and/or modify it
under the same terms as Perl itself.
