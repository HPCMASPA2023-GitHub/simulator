export prefix=/home/craig/LANL/sim/basefiles_paper/simulator
export SBATCH_PARTITION=standard
export PATH=$PATH:$prefix/charliecloud/charliecloud/bin:$prefix/basefiles:$prefix/Install/bin:/usr/bin:/usr/sbin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$prefix/Install/lib:$prefix/Install/lib64
export LMOD_SH_DBG_ON=1
source $prefix/python_env/bin/activate

