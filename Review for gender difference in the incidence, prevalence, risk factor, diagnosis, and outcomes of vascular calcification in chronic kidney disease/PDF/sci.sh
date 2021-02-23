#!/usr/bin/env bash
# wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
# echo $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
sci="https://sci-hub.se/"
doi=(
10.1111/j.1525-1594.2009.00814.x
10.1111/j.1540-8191.2007.00431.x
)

for f in ${doi[@]};
do
  DOI=$(curl ${sci}${f} | grep -ohP 'https\:\/.*?\.pdf' | head -1)
  echo $DOI
    if [ "$DOI" ]; then
      wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $DOI 2>/dev/null
    else
      echo "No pdf for $f"
    fi

done
