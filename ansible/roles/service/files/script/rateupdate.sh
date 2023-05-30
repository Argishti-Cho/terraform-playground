#!/bin/bash
curl -o /tmp/full.html https://rate.am

cat /tmp/full.html | sed -n '/^<tr id="/,$p' | sed '/^<td colspan="/Q' > /tmp/cleaned.html

cat /tmp/cleaned.html | awk '/^<tr id="[0-9a-zA-Z-]*">$/{p=NR+8} NR==p' | sed 's/[^0-9.]//g' > /tmp/bestsell.txt
cat /tmp/cleaned.html | awk '/^<tr id="[0-9a-zA-Z-]*">$/{p=NR+9} NR==p' | sed 's/[^0-9.]//g' > /tmp/bestbuy.txt

bestsell=$(sort -n /tmp/bestsell.txt | tail -n 1)
bestbuy=$(sort -n /tmp/bestbuy.txt | head -n 1)
bestsellbank=$(cat /tmp/cleaned.html | grep -B 5 $bestsell | grep -o '^<img align="left" border="0" width="32" height="16" alt=.*>.*</a></td>$' | sed 's/<\/a><\/td>$//' | sed -r 's/.*>([^>]+)$/\1/g')
bestbuybank=$(cat /tmp/cleaned.html | grep -B 6 $bestbuy | grep -o '^<img align="left" border="0" width="32" height="16" alt=.*>.*</a></td>$' | sed 's/<\/a><\/td>$//' | sed -r 's/.*>([^>]+)$/\1/g')

rm /tmp/full.html && rm /tmp/cleaned.html && rm /tmp/bestsell.txt && rm /tmp/bestbuy.txt

echo "<meta charset="utf-8"><h1>Best sell rate: ֏$bestsell to $bestsellbank</br>Best buy rate: ֏$bestbuy from $bestbuybank</h1><body><p>as of $(date)</p></body>" > ~/rate-website/index.html