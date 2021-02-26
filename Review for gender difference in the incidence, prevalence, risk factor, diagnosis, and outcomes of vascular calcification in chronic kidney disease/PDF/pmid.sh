#!/usr/bin/env bash

Link="http://www.ncbi.nlm.nih.gov/pubmed/"
PMCLink="http://www.ncbi.nlm.nih.gov/pmc/articles/"
ID=(        
23927679
)


for f in ${ID[@]};
do
  PMCID=$(wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1" \
   -l1 --no-parent ${Link}${f} -O - 2>/dev/null | grep -Po 'PMC\d+' | head -n 1)
    if [ $PMCID ]; then
       wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1" \
            -l1 --no-parent -A.pdf ${PMCLink}${PMCID}/pdf/ -O ${f}.pdf 2>/dev/null
    else
       echo "No PMC ID for $f"
    fi

done
