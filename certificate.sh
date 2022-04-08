set -e

EXPIRED=0
for url in $(cat certificate.txt); do
    echo "$url"
    if true | openssl s_client -connect "$url" 2>/dev/null | openssl x509 -noout -checkend 0; then
        echo "Certificate is not expired"
    else
        echo "Certificate is expired"
        EXPIRED=1
    fi
    echo "--------------------------------------"
done

if [ $EXPIRED -eq 1 ]; then
    exit 1
fi