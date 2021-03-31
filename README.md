# Compi pipeline blast example
This is a Compi example which ports to Compi a [Nextflow example pipeline](https://github.com/nextflow-io/blast-example) using BLAST.

## Prerequisites

- [Compi Development Kit (Compi-DK)](https://sing-group.org/compi/#downloads)
- [Docker](https://www.docker.com/)

## Building the pipeline

Move to the directory of the cloned respository of this pipeline and run `compi-dk build` inside it.

```bash
compi-dk build
```

## Running the pipeline with sample data

The Nextflow example contains some sample data:

- A fasta file, located at `/data/fasta.fa` inside the Docker image.
- A Blast database, located at `/blast-db/pdb/tiny` inside the Docker image.


In order to run the pipeline with the same sample data as Nextflow example, you have to run:

```bash
docker run -v /tmp:/result sing-group/compi-blast-example -o -- --chunkSize 2
```

A `results.txt` file will be created inside `/tmp` (see `-v /tmp:/result`).

## Running the pipeline with custom data

You can specify the `query` and `database` parameters of the pipeline. You will have to mount your data directory when running the Docker image. For example, `my-data-dir` could be a directory in your host machine containing both the fasta files and the BLAST database.

- `my-data-dir`
    - `myfasta.fa`
    - `/blast-db/mydatabase`

Next, you have to mount the data directory inside the Docker image when running it (see `-v my-data-dir:/data`) and pass the `query` and `database` parameters.

```bash
docker run -v /tmp:/result -v my-data-dir:/data sing-group/compi-blast-example -o -- --chunkSize 2 --query /data/myfasta.fa --database /data/blast-db/mydatabase
```


