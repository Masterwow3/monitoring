set -e

for ip in $(cat ping4.txt); do
  echo "$ip"
  ping -c4 "$ip"
done