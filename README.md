# rserver-binfotron

## Introduction
This Dockerfile is used to run binfotron functions.


## DockerHub link:  
https://hub.docker.com/repository/docker/benjaminvincentlab/rserver-binfotron   


## Building locally
```bash
docker build -t benjaminvincentlab/rserver-binfotron:4.0.3.2 .
```


## Running locally
```bash
docker run -e PASSWORD=12qwaszx --rm -p 8787:8787 -v ~/Desktop:/home/rstudio benjaminvincentlab/rserver-binfotron:4.0.3.2 8787
```
Then direct browser to localhost:8787.  


## Running on the bioinf cluster with singularity

Either make sure you do all of the following:
* Use the --pid flag. This makes sure the job kills all of the rserver's processes when the job ends. If you don't use this flag, your processess will be left running on the cluster and the next person who uses that node won't be able to change from your bindings.
* Use an open port
* Use a unique '--server-data-dir'
```
data_dir=$(mktemp -d -t rserver-XXXXXXXX)}
```
* Make a '--database-config-file' 
```
  database_config_path=${data_dir}/database.conf
  echo "provider=sqlite" > $database_config_path
  echo "directory=${data_dir}" >> $database_config_path
  echo "provider=postgresql" >> $database_config_path
  echo "host=localhost" >> $database_config_path
  echo "database=rstudio" >> $database_config_path
  echo "port=5432" >> $database_config_path
  echo "username=postgres" >> $database_config_path
  echo "password=postgres" >> $database_config_path
  echo "connection-timeout-seconds=10" >> $database_config_path
  echo "connection-uri=postgresql://postgres@localhost:5432/rstudio?sslmode=allow&options=-csearch_path=public" >> $database_config_path
```
* Then run
```
singularity exec --pid --nohttps --home $rstudio_home_dir --bind $bindings $image_path \
      rserver --www-port $source_command --server-data-dir $data_dir --database-config-file $database_config_path"
```

*- or -*

Use [run_rserver](https://sc.unc.edu/benjamin-vincent-lab/scripts/run_rserver) to run it.  It will do all of the above steps for you.


## Decoding the tag structure
v.w.x.y 
vwx is the version of R.  
y is the version of this Dockerfile.  
