FROM nextflow/examples
LABEL maintainer="lipido"

# INSTALL COMPI
ADD image-files/compi.tar.gz /

# PLACE HERE YOUR DEPENDENCIES (SOFTWARE NEEDED BY YOUR PIPELINE)

# Seqkit
RUN wget https://github.com/shenwei356/seqkit/releases/download/v0.15.0/seqkit_linux_amd64.tar.gz \
  && tar xzvf seqkit_linux_amd64.tar.gz \
  && mv seqkit /usr/local/bin

# Add sample-data
RUN wget https://github.com/nextflow-io/blast-example/archive/refs/heads/master.zip \
  && unzip master.zip \
  && mv blast-example-master/data /data \
  && mv blast-example-master/blast-db /blast-db \
  && rm -rf blast-example-master \
  && rm master.zip
  
# ADD PIPELINE
ADD pipeline.xml /pipeline.xml
ENTRYPOINT ["/compi", "run",  "-p", "/pipeline.xml"]

