set -e

DOWN=0
for url in $(cat website.txt); do
    echo "$url"
    if wget --no-check-certificate --spider -S "$url" 2>&1 | grep -w "200" ; then
        echo "is up"
    else
        echo "is down"
        DOWN=1
    fi
    echo "--------------------------------------"
done

if [ $DOWN -eq 1 ]; then
    exit 1
fi