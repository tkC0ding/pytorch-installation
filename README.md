to install <mark>pytorch version 2.4.x</mark> in your system, you need compatible nvidia drivers, cuda toolkit and cudnn installed.

## Steps:
- Update and upgrade the system
- install miniconda
- create a conda environment
- install compatible nvidia driver and reboot
- install cuda 12.4
- install cudnn 9.2.1
- install pytorch

### Requirements for pytorch 2.4.x:
- Ubuntu OS version 20.04 / 22.04
- Nvidia driver version 535
- CUDA Toolkit version 12.4
- GCC version 9.4.0
- GlibC version 2.31
- cuDNN version 9.2.1
- python version 3.9.18 in the conda environment

The <mark>driver_install.sh</mark> file updates and upgrades the system which installs the required versions on gcc and glibc. Then it installs miniconda and creates a conda environment named __tf__ with python version 3.9.18. Then the nvidia 535 driver is installed the system is rebooted.


After the driver is installed and the conda environment is set up, run the <mark>torch_install.sh</mark> file, it activates the conda environment and then installs __CUDA 12.4__ and __cuDNN 9.2.1__ based on your <mark>OS version(Ubuntu 20.04 or 22.04)</mark>

After this pytorch is installed : )