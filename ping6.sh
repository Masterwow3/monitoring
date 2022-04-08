set -e

for ip in $(cat ping6.txt); do
  echo "$ip"
  ping -6 "$ip"
done