#!/bin/bash

# environment required
source /usr/local/lsf/conf/profile.lsf
source /lustre/scratch114/teams/hgi/lustre_reports/mpistat/venv-farm5/bin/activate
#export MPI_HOME=/software/hgi/pkglocal/openmpi-1.8.8-lsf-9.1.3
#export GCC_HOME=/software/hgi/pkglocal/gcc-4.9.1
export LD_LIBRARY_PATH=$GCC_HOME/lib64:$GCC_HOME/lib:$MPI_HOME/lib:$LD_LIBRARY_PATH
export PATH=$MPI_HOME/bin:$GCC_HOME/bin:$PATH

#export MODULEPATH=/software/modules:$MODULEPATH
#module load ISG/openmpi/4.0.3
# loading modules in a script is troublesome
export PATH=/software/openmpi-4.0.3/bin:$PATH
export LD_LIBRARY_PATH=/software/openmpi-4.0.3/lib:$LD_LIBRARY_PATH

export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

mpirun --allow-run-as-root python /lustre/scratch114/teams/hgi/lustre_reports/mpistat/bin/mpistat.py $@

