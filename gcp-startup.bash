#!/bin/bash

function create_user_accounts()
{
  local flag=
  local line=
  while read -r line; do
    local IFS=":"
    local line=($line)
    local netID=${line[0]}
    local uID=${line[2]}
    local gID=${line[3]}
    local name=${line[4]}

    if [[ -d /home/${netID} ]]; then flag="-M"; fi

    /usr/sbin/groupadd -g ${gID} ${netID}
    /usr/sbin/useradd ${flag} -g ${gID} -s /bin/bash -u ${uID} -c "${name}" ${netID}
  done <<EOF
sw77:x:1296493:1296493:Shenglong Wang:/home/sw77:/bin/bash
wang:x:10015:10015:Shenglong Wang:/home/wang:/bin/bash
wd35:x:2761180:2761180:Wensheng Deng:/home/wd35:/bin/bash 
tc1841:x:2420783:2420783:Taidi Chen:/home/tc1841:/bin/bash 
kc4207:x:3334730:3334730:Kevin Chan:/home/kc4207:/bin/bash
np3129:x:4441975:4441975:Nishant Pushparaju:/home/np3129:/bin/bash
zl4682:x:3912091:3912091:Ashley Liu:/home/zl4682:/bin/bash
EOF

  unset IFS
}

create_user_accounts
