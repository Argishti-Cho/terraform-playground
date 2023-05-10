wget -N -P /tmp/rates/ https://rate.am/

cat /tmp/rates/index.html | awk '/^<tr id="[0-9a-zA-Z-]*">$/{p=NR+8} NR==p' | sed 's/[^0-9.]//g' > /tmp/rates/bestsell.txt
cat /tmp/rates/index.html | awk '/^<tr id="[0-9a-zA-Z-]*">$/{p=NR+9} NR==p' | sed 's/[^0-9.]//g' > /tmp/rates/bestbuy.txt

bestsell=$(sort -n /tmp/rates/bestsell.txt | tail -n 1)
bestbuy=$(sort -n /tmp/rates/bestbuy.txt | head -n 1)

# echo $bestsell
# echo $bestbuy

bestsellbank=$(cat /tmp/rates/index.html | grep -B 5 $bestsell | grep -o '^<img align="left" border="0" width="32" height="16" alt=.*>.*</a></td>$' | sed "s/.*'>//" | sed 's/<\/a><\/td>$//')
bestbuybank=$(cat /tmp/rates/index.html | grep -B 6 $bestbuy | grep -o '^<img align="left" border="0" width="32" height="16" alt=.*>.*</a></td>$' | sed "s/.*'>//" | sed 's/<\/a><\/td>$//')

# echo $bestsellbank
# echo $bestbuybank

echo "<meta charset="utf-8"><h1>Best sell rate: ֏$bestsell to $bestsellbank</br>Best buy rate: ֏$bestbuy from $bestbuybank</h1><body><p>as of $(date)</p></body>" > /var/www/rate-website/index.html