docker build -t harbor.hpc.ford.com/enandhag/docai:v1 \
             --build-arg https_proxy=http://internet.ford.com:83/ \
             --build-arg http_proxy=http://internet.ford.com:83/ \
             --build-arg no_proxy=.ford.com,localhost,127.0.0.1 \
             -f Dockerfile .