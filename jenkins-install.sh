if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo access" 1>&2
   exit 1
fi

sudo dnf install yum-utils
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl status jenkins
