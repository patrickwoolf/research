#!/usr/bin/env bash

Link="http://www.ncbi.nlm.nih.gov/pubmed/"
PMCLink="http://www.ncbi.nlm.nih.gov/pmc/articles/"
ID=(        
3340252
18721733
11774125
25479288
24289833
22259897
31122190
25465028
22013298
29558928
29619867
24447254
24506475
31291619
26505822
31437840
30347400
15648030
20237457
28124305
25571879
25823466
12378387
21414968
26865177
22143191
21281749
22143191
26331407
18852190
26890570
29236239
20420796
16940716
11849871
24318369
17928470
18802328
23605174
27519971
19491380
21139318
20630128
24709688
17259697
15882283
22980963
22483469
18800030
19574342
15780108
27516144
16554319
17524408
22169112
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
