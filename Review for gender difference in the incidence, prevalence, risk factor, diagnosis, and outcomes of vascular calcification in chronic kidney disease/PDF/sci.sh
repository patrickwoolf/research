#!/usr/bin/env bash
# wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
# echo $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
sci="https://sci-hub.se/"
doi=(
10.2174/157016108783955374
)

rm scipdf.txt
for f in ${doi[@]};
do
  DOI=$(curl ${sci}${f} | grep -ohP 'https\:\/.*?\.pdf' | head -1)
  if [ ! "$(curl ${sci}${f} | grep -hP 'http.*?pdf')" ]; then echo 'https://'$(curl ${sci}${f} | grep -ohP 'sci.*?pdf' | head -1) >> scipdf.txt; fi
  echo $DOI >> scipdf.txt
#    if [ "$DOI" ]; then
#      wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $DOI 2>/dev/null
#    else
#      echo "No pdf for $f"
#    fi
done
wget -i scipdf.txt
