#!/usr/bin/env bash

Link="http://www.ncbi.nlm.nih.gov/pubmed/"
PMCLink="http://www.ncbi.nlm.nih.gov/pmc/articles/"
ID=(        
24119158
28253835
22723973
19681840
28202017
33541279
23758931
17803573
24847332
27988970
30411726
32033584
21940840
26629071
23874471
30777028
28036114
17014511
26336882
21770856
19259046
20576822
33532079
26464074
31599199
29764395
19021697
28886041
27004031
25326683
27648407
25479288
27068711
29664315
24289833
26558187
22259897
28870151
19696217
31122190
25465028
28428481
22013298
21852662
29558928
26268579
29619867
24447254
24506475
19443628
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
