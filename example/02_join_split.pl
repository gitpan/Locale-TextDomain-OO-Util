#!perl ## no critic (TidyCode)

use strict;
use warnings;

use Data::Dumper ();
use Locale::TextDomain::OO::Util::JoinSplitLexiconKeys;
use charnames qw(:full);

our $VERSION = 0;

my $key_util = Locale::TextDomain::OO::Util::JoinSplitLexiconKeys->instance;

() = print {*STDOUT} Data::Dumper ## no critic (LongChainsOfMethodCalls)
    ->new(
        [
            [
                $key_util->join_lexicon_key({}),
                $key_util->split_lexicon_key,
                $key_util->join_lexicon_key({
                    language => 'de-de',
                    category => 'my category',
                    domain   => 'my domain',
                }),
                $key_util->join_lexicon_key(
                    {
                        language => 'de-de',
                        category => 'my category',
                        domain   => 'my domain',
                        project  => 'my project',
                    },
                    'JSON',
                ),
                $key_util->split_lexicon_key('de-de:my category:my domain'),
                $key_util->split_lexicon_key(
                    'de-de:my category:my domain:my project',
                    'JSON',
                ),
                $key_util->join_message_key({}),
                $key_util->split_message_key,
                $key_util->join_message_key(
                    {
                        msgctxt      => 'my context',
                        msgid        => 'my singular',
                        msgid_plural => 'my plural',
                    },
                ),
                $key_util->join_message_key(
                    {
                        msgctxt      => 'my context',
                        msgid        => 'my singular',
                        msgid_plural => 'my plural',
                    },
                    'JSON',
                ),
                $key_util->split_message_key(
                    "my singular\N{NULL}my plural\N{END OF TRANSMISSION}my context",
                ),
                $key_util->split_message_key(
                    'my singular{PLURAL_SEPARATOR}my plural{MSG_KEY_SEPARATOR}my context',
                    'JSON',
                ),
                $key_util->join_message(
                    "my singular\N{NULL}my plural\N{END OF TRANSMISSION}my context",
                    {
                        msgstr_plural => [ 'tr singular', 'tr plural' ],
                    },
                ),
                [
                    $key_util->split_message(
                        {
                            msgctxt       => 'my context',
                            msgid         => 'my singular',
                            msgid_plural  => 'my plural',
                            msgstr_plural => [ 'tr singular', 'tr plural' ],
                        },
                    ),
                ],
                $key_util->join_message(
                    'my singular{PLURAL_SEPARATOR}my plural{MSG_KEY_SEPARATOR}my context',
                    {
                        msgstr_plural => [ 'tr singular', 'tr plural' ],
                    },
                    'JSON',
                ),
                [
                    $key_util->split_message(
                        {
                            msgctxt       => 'my context',
                            msgid         => 'my singular',
                            msgid_plural  => 'my plural',
                            msgstr_plural => [ 'tr singular', 'tr plural' ],
                        },
                        'JSON',
                    ),
                ],
            ],
        ],
    )
    ->Indent(1)
    ->Quotekeys(0)
    ->Terse(1)
    ->Useqq(1)
    ->Dump;

# $Id: 02_join_split.pl 527 2014-10-18 11:01:51Z steffenw $

__END__

Output:

[
  "i-default::",
  {},
  "de-de:my category:my domain",
  {
    domain => "my domain",
    language => "de-de",
    category => "my category"
  },
  "",
  {},
  "my singular\0my plural\4my context",
  {
    msgctxt => "my context",
    msgid => "my singular",
    msgid_plural => "my plural"
  }
]
