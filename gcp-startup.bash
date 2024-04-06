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
ama10047:x:3607771:3607771:Abdul Muqeet Agha:/home/ama10047:/bin/bash
aia7143:x:4208823:4208823:Ayyaz Akhtar:/home/aia7143:/bin/bash
pp2959:x:4216356:4216356:Preetham Rakshith Prakash:/home/pp2959:/bin/bash
zw2686:x:3509154:3509154:Sid Wang:/home/zw2686:/bin/bash
EOF

  unset IFS
}

create_user_accounts
