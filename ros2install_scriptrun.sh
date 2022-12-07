#! /bin/bash

##################################################################################

#Reference link for ROS2 Foxy Installation on Ubuntu 20.04 (64 bit).
# https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html

##################################################################################

#Set Below variable to 1 to install ROS2 development tools.
INSTALL_DEV_TOOLS=0

##################################################################################

# Stop execution instantly as a query exits while having a non-zero status.
set -e

##################################################################################

#Function to check if passed package name is already installed or not.
#returns 1 if package is already installed else returns 0.

IsPackageInstalled()
{
	local PACKAGE=$1
	local INSTALLED=$(dpkg -l | grep ${PACKAGE} >/dev/null && echo "1" || echo "0")
	if [ $INSTALLED == "1" ]; then
		echo "**********$PACKAGE is already installed**********"
		return 1
	else 
		echo "**********$PACKAGE is NOT Installed**********"
		return 0
	fi
}

##################################################################################

#Ask user whether he wants to install a Desktop version or Base version.
echo 'Choose version:'
echo '1 - Desktop (Recommended): ROS, RViz, demos, tutorials.'
echo '2 - Base (Bare Bones): No GUI tools.'

read VERSION
if [ "$VERSION" != "1" ] && [ "$VERSION" != "2" ]; then
  echo 'Only 1 or 2 are allowed, not '$VERSION
  exit 1
fi

##################################################################################

#Set locale, Make sure you have a locale which supports UTF-8.
echo "**********Setting locale**********"
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
#locale  # verify settings

##################################################################################

#Ensure that the Ubuntu Universe repository is enabled.
echo "**********Setting Ubuntu Universe repository**********"
sudo apt install -y software-properties-common
sudo add-apt-repository universe

##################################################################################

#Add the ROS 2 GPG key with apt.
echo "**********Setting ROS 2 GPG key**********"
sudo apt update

name=curl
which $name > /dev/null 2>&1

if [ $? == 0 ]; then
    echo "**********$name is already installed**********"
else
    echo "**********$name is not installed, Installing $name**********"
    sudo apt install -y $name
fi 

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

##################################################################################

#Add the repository to your sources list.
echo "**********Adding repository to your sources list**********"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

##################################################################################

#Update your apt repository caches after setting up the repositories.
echo "**********Running update**********"
sudo apt update

#ROS 2 packages are built on frequently updated Ubuntu systems. It is always recommended that you ensure your system is up to date before installing new packages.
echo "**********Running upgrade**********"
sudo apt upgrade -y

##################################################################################

#Check if package is already installed or not.
if [ "$VERSION" = "1" ]; then
  PackageToInstall="ros-foxy-desktop"
else
  PackageToInstall="ros-foxy-ros-base"
fi

set +e
IsPackageInstalled $PackageToInstall
VarIsPackageInstalled=$?
set -e


#Install user selected ROS2 version (Desktop or Base Bare Bone) if the package was not installed previously
if [ $VarIsPackageInstalled == 0 ]; then
  echo "**********Installing $PackageToInstall**********"
  sudo apt install -y $PackageToInstall python3-argcomplete 
fi

##################################################################################

#Development tools: Compilers and other tools to build ROS packages.
if [ "$INSTALL_DEV_TOOLS" = "1" ]; then
  PackageToInstall="ros-dev-tools"
  set +e
  IsPackageInstalled $PackageToInstall
  VarIsPackageInstalled=$?
  set -e
  if [ $VarIsPackageInstalled == 0 ]; then
  	echo "**********Installing $PackageToInstall**********"
  	sudo apt install -y $PackageToInstall
  fi
fi  

##################################################################################

#Set up your environment by sourcing the following file if it exists.
SetUpFileName="/opt/ros/foxy/setup.bash"
if [ -e $SetUpFileName ]; then
	echo "**********Sourcing $SetUpFileName file**********"
	source $SetUpFileName
	#echo "$SetUpFileName" >> ~/.bashrc
fi

##################################################################################

#If you installed ros-foxy-desktop above, you can try some examples. In one terminal, source the setup file and then run a C++ talker:
#source $SetUpFileName
#ros2 run demo_nodes_cpp talker


#If you installed ros-foxy-desktop above, you can try some examples. In another terminal source the setup file and then run a Python listener:
#source $SetUpFileName
#ros2 run demo_nodes_py listener

##################################################################################

echo "**********Success Installing ROS2 Foxy!!!**********"

#############################END OF SCRIPT########################################






























#! /bin/bash

##################################################################################

#Reference link for ROS2 Foxy Installation on Ubuntu 20.04 (64 bit).
# https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html

##################################################################################

#Set Below variable to 1 to install ROS2 development tools.
INSTALL_DEV_TOOLS=0

##################################################################################

                                #Set locale

####################################################################################

#locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

#locale  # verify settings

#######################################################################
                     
                               #setup Sources

###################################################################		     
#You will need to add the ROS 2 apt repository to your system.

#First ensure that the Ubuntu Universe repository is enabled.


sudo apt install software-properties-common

sudo add-apt-repository universe



#Now add the ROS 2 GPG key with apt.
sudo apt update && sudo apt install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg


#Then add the repository to your sources list.
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
