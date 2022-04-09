set -e

for ip in $(cat ping6.txt); do
  echo "$ip"
  ping6 -c 4 "$ip"
done