#this is a bash script. To execute, use bash build.sh.

targets=($( cat pages.txt| awk '{print $1;}' |sed 's/[:;,]//g'))
list="${!targets[@]}"
for i in $list; do
    line=$( cat pages.txt |sed -n $((i+1))p |sed 's/[:;,]//g')
    target=$( echo $line |cut -d " " -f1)
    echo $target
done