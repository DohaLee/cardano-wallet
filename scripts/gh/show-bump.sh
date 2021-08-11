#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix coreutils gnugrep gnused html-xml-utils

# Needs gnused and W3C html-xml-utils
# shellcheck disable=SC2016

set -euo pipefail

hxnormalize -x 'https://bump.sh/doc/cardano-wallet-diff/changes' \
    | hxselect "ul.timeline-event-diff" \
    | hxselect -s '\n' "ul:first-child" \
    | sed -z 's/\n[ ]\+/ /g' \
    | hxselect -c -s '\n' 'li' \
    | sed 's/^\([ ]*\)\([A-Z][^:]\+: \)\(.*\)$/\1- \2`\3`/g'
