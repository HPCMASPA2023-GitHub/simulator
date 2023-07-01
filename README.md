<!-- Required extensions:  codehilite,markdown.extensions.tables,pymdownx.magiclink,pymdownx.betterem,pymdownx.tilde,pymdownx.emoji,pymdownx.tasklist,pymdownx.superfences,pymdownx.saneheaders -->




<!-- ----------------------------------------------------------------  Intro --------------------------------------------- -->
$\textbf{\Huge simulator}$ <br />

Our work makes use of Inria's Batsim (https://batsim.readthedocs.io/) simulator.

We have added:

- a node fault model with repair times
- checkpointing
- reservations
- some work with cores
- other useful additions

These were added to 4 scheduling algorithms:

- fcfs_fast2
- easy_bf_fast2
- easy_bf_fast2_holdback
- conservative_bf $\space \space \space \space \space \space \mathbb{\color{darkred}\longleftarrow} \text{\color{darkred} reservations only work with this algorithm}$

In addition to this is also a framework for spinning up simulations and for post processing.

Scripts are provided to apply patches to the original Batsim source and run experiments congruent with those presented in our article.  The initial deployment of our code is all handled by one deploy script.  The running of a simulation or simulations can all be done by writing a config file and running a single script.

Analysis of the simulation data is mostly up to you, but there are some helpful jupyter notebooks to faciliate this by looking at our code and modifying it for your needs.  However, scripts for the analysis of data obtained from running the example configs that were used in our article are provided.  These can be run as-is.


<!-- ----------------------------------------------------------------  Table of Contents --------------------------------------------- -->
## Table of Contents
- [Deployment](#deployment)
    - [Deploy Methods](#build_methods)
    - [Deploy: How To...](#deploy_how_to)
        - [Bare-Metal](#deploy_bare_metal)
        - [Docker](#deploy_docker)
        - [CharlieCloud with Internet](#deploy_charliecloud_with_internet)
        - [CharlieCloud without Internet](#deploy_charliecloud_without_internet)
- [Make Sure Everything Works](#run_tests_works)
    - [Bare-Metal works](#run_tests_works_bare_metal)
    - [Docker works](#run_tests_works_docker)
    - [CharlieCloud works](#run_tests_works_charliecloud)
- [Verifying Paper](#run_tests_verify)
    - [Bare-Metal verification](#run_tests_verify_bare_metal)
        - [parallel](#run_tests_verify_bare_metal_parallel)
        - [serial](#run_tests_verify_bare_metal_serial)
    - [Docker verification](#run_tests_verify_docker)
        - [parallel](#run_tests_verify_docker_parallel)
        - [serial](#run_tests_verify_docker_serial)
    - [CharlieCloud verification](#run_tests_verify_charliecloud)
        - [parallel](#run_tests_verify_charliecloud_parallel)
        - [serial](#run_tests_verify_charliecloud_serial)
- [Further Reading](#further_reading)
    - [Config Files](#config_files)


<!-- ----------------------------------------------------------------  Deployment --------------------------------------------- -->
***


<a name="deployment"></a>
# Deployment

<a name="build_methods"></a>
## Deploy Methods
<details>
There are 4 methods of building and deploying our batsim applications.

- bare-metal
    - will compile and install everything you need into a directory
- docker
    - will compile and install everything you need into a docker container
    - currently there is no option of parallelism with this method
- charliecloud with internet
    - charliecloud is a container technology that works when docker is not an option (think clusters without docker)
    - will compile and install everything you need into a directory
- charliecloud without internet
    - charliecloud is a container technology that works when docker is not an option (think clusters without docker)
    - meant to be run where you have internet
        - will compile and install everything you need and will be packaged into a directory to be copied to your setup without internet

</details>

<a name="deploy_how_to"></a> 
## Deploy: How To...

<a name="deploy_bare_metal"></a>
###  Bare-Metal

<details>

1. obtain the code
2. change directories
3. deploy
```
git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
cd simulator/basefiles
./deploy.sh -f bare-metal --prefix $(dirname `pwd`)
```

</details>

<a name="deploy_docker"></a>
### Docker

<details>

1. obtain the code
2. change directories
3. deploy
```
git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
cd simulator/basefiles
./deploy.sh -f docker
```

</details>

<a name="deploy_charliecloud_with_internet"></a> 
### CharlieCloud with Internet
<details>

1. obtain the code
2. change directories
3. deploy
```
git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
cd simulator/basefiles
./deploy.sh -f charliecloud
```

</details>

<a name="deploy_charliecloud_without_internet"></a> 
### CharlieCloud without Internet

<details>

1. obtain the code
2. change directories
3. deploy package
4. change directories
5. scp folder
6. ssh to remote
7. change directories
8. unpackage
```
git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
cd simulator/basefiles
./deploy.sh -f charliecloud --no-internet --package
cd ../../
scp -r ./batsim_packaged user@remote.org:/home/USER/
ssh user@remote.org
cd /home/USER/batsim_packaged
./deploy.sh -f charliecloud --no-internet --un-package
```

</details>




<!-- ----------------------------------------------------------------  Make Sure Everything Works --------------------------------------------- -->
***



<a name="run_tests_works"></a> 
# Make Sure Everything Works

You can make sure your particular deployment works by looking at the section of your deployment method
and running the commands contained there.

Keep in mind that parallel tests assume the following:

- You are on a cluster running SLURM
- You have access to at least two (2) nodes


<a name="run_tests_works_bare_metal"></a> 
## Bare-Metal works

<details>

1. change directories
2. edit basefiles/batsim_environment.sh
3. run test_serial script
4. view result
5. run test_parallel script
6. view result
```
cd /path/to/simulator/basefiles
edit ./batsim_environment.sh   # make sure you point prefix to /path/to/simulator (don't include basefiles in the path)
./tests/bare_metal/tests_serial.sh
```

You should see two SUCCESS messages

</details>

<a name="run_tests_works_docker"></a> 
## Docker works
<details>

1. create and run a container from your "simulator_compile" image
2. change directories (should already be in the correct directory)
3. edit basefiles/batsim_environment.sh 
4. run test_serial script
5. view result
6. exit docker

```
docker run -it --name sim_test simulator_compile:latest
inside docker> cd /home/sim/simulator/basefiles
inside docker> # edit ./batsim_environment.sh  # prefix should be /home/sim/simulator
inside docker> ./tests/docker/tests_serial.sh
inside docker> exit

```
You should see a SUCCESS message

</details>

<a name="run_tests_works_charliecloud"></a> 
## CharlieCloud works

<details>

1. change directories
2. edit basefiles/batsim_environment.sh
3. run test_serial script
4. view result
5. run test_parallel script
6. view result
```
cd /path/to/simulator/basefiles
edit ./batsim_environment.sh   # make sure you point prefix to /path/to/simulator (don't include basefiles in the path)
./tests/charliecloud/tests_serial.sh
./tests/charliecloud/tests_parallel.sh
```
You should see two SUCCESS messages

</details>


<!-- ----------------------------------------------------------------  Verifying Paper --------------------------------------------- -->
***


<a name="run_tests_verify"></a>
# Verifying Paper

<a name="run_tests_verify_bare_metal"></a>
# Bare-Metal Verification

<a name="run_tests_verify_bare_metal_parallel"></a>
### Parallel

<a name="run_tests_verify_bare_metal_serial"></a>
### Serial

<a name="run_tests_verify_docker"></a>
## Docker Verification

<a name="run_tests_verify_docker_parallel"></a>
### Parallel

<a name="run_tests_verify_docker_serial"></a>
### Serial


<a name="run_tests_verify_charliecloud"></a>
## CharlieCloud Verification

<a name="run_tests_verify_charliecloud_parallel"></a>
### Parallel

<a name="run_tests_verify_charliecloud_serial"></a>
### Serial



<!-- ------------------------------------------------------------   Further Reading ----------------------------------------------- -->
***


<a name="further_reading"></a>
# Further Reading

<a name="config_files"></a>
## Config Files

If you would like to run other experiments, feel free to 









