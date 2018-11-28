# debian-docker
Custom Debian (stretch and jessie) Docker image.
Build stretch and jessie from official slim debian with **dumb-init**, **gosu** and **some useful debian packages**.

# List of packages
`apt-transport-https  apt-utils  
 ca-certificates  curl 
 debian-archive-keyring  gnupg  
 bzip2  dirmngr  gettext-base 
 git  htop  inetutils-ping  
 iotop  less  mercurial  nano  
 ncdu  net-tools  netcat  
 openssh-client  patch  procps  
 rsync socat subversion sysstat 
 tcpdump telnet unzip wget 
 xmlstarlet zip`

# How to build
Set **REPO_NAME** and **TIMEZONE**in `build.properties` file. REPO_NAME used to tagging and pushing image and timezone used fir image timezone.
run `build.sh` to build both stretch and jessie image.
run `push.sh` to push to docker hub.
