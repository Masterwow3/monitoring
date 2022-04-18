set -e

websiteV4.sh 2>&1 | tee results/websiteV4.txt
websiteV6.sh 2>&1 | tee results/websiteV6.txt
certificate.sh 2>&1 | tee results/certificate.txt


if [[ `git status --porcelain` ]]; then
  # Changes
  git commit -a -m "update"
  git push
  exit 1
else
  # No changes
fi
