set -q MARLIN_HISTORY
  or set -g MARLIN_HISTORY "$HOME/.marlin-history"


function marlin:pwd-listener --on-variable PWD
  marlin:log $PWD
end

if status --is-interactive; and type -q expand-word
  expand-word -p '^,.*$' -e marlin:complete
end

set -l name (basename (status -f) .fish){_uninstall}

function $name -e $name
    echo $name
    set -e MARLIN_HISTORY
    functions -e (functions -a | awk '/^marlin:/')
end
