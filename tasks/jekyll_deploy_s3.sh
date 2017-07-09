#!/bin/bash -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code
bundle install

gem install s3_website

bundle exec jekyll build

# Configure s3_website

cat > s3_website.yml <<EOF
s3_id: $AWS_Access
s3_secret: $AWS_Secret
s3_bucket: $AWS_Bucket
max_age: 86400
gzip: true
s3_endpoint: $AWS_Zone
EOF

s3_website push --config-dir .
