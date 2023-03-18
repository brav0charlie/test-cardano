##############################################################################
# Git/Docker Installation
# This script automatically downloads and installs docker and git
##############################################################################

# Logging colors
Blue='\033[0;34m'                 # Text Color Blue
color_off='\033[0m'               # End Text Coloring
INFO="[${Blue}INFO${color_off}]"  # INFO tag

# Environment Info
echo "$INFO This script was developed on Ubuntu 22.04.2 LTS"
echo "$INFO You are currently running: $(head -1 /etc/os-release | cut -d "\"" -f 2)"

# Move to current user home directory, where installation files will be hosted
cd ~

# Update OS packages and install prerequisite packages
echo "$INFO Installing updates and prerequisites..."
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install git curl
echo "$INFO Update installation completed."

# Download and install Docker
echo "$INFO Installing docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh


# Add the current user to the docker group
echo "$INFO Adding user \"`whoami`\" to the docker group..."
sudo groupadd docker
sudo usermod -aG docker `whoami`

# Conclude installation
echo "$INFO $(docker --version) installation has been completed."