
# Install cuda tookit

sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'

sudo apt-get update

sudo apt-get install -y cuda-toolkit-10-2

sudo apt-get install -y cuda-toolkit-11-0

sudo apt-get install -y cuda-toolkit-11-2

sudo cp /usr/lib/wsl/lib/nvidia-smi /usr/bin/nvidia-smi

sudo chmod ogu+x /usr/bin/nvidia-smi

# Install cuda wsl-ubuntu

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin

sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-wsl-ubuntu-11-2-local_11.2.2-1_amd64.deb

sudo dpkg -i cuda-repo-wsl-ubuntu-11-2-local_11.2.2-1_amd64.deb

sudo apt-key add /var/cuda-repo-wsl-ubuntu-11-2-local/7fa2af80.pub

sudo apt-get update

sudo apt-get -y install cuda

vi ~/.profile

export LD_LIBRARY_PATH=/usr/local/cuda/lib

export PATH=$PATH:/usr/local/cuda/bin

source ~/.profile

## Install necessary lib

sudo apt-get install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev

sudo apt install nasm

# Build and install nv-codec-headers

git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git

cd nv-codec-headers

make

sudo make install PREFIX="/opt/ffmpeg_build"

cd ..

# Build and install x264

git clone https://code.videolan.org/videolan/x264.git

cd x264

make

make install

cd ..

# Build and install ffmpeg

git clone https://git.ffmpeg.org/ffmpeg.git 

cd ffmpeg/

:set fileformat=unix

:x!

./configure --enable-nonfree --enable-nvenc --enable-libx264 --enable-gpl --enable-cuda --enable-cuvid --enable-cuda-nvcc

make -j 8

sudo make install
