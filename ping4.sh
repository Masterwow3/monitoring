set -e

for ip in $(cat ping4.txt); do
  echo "$ip"
  ping -4 "$ip"
done