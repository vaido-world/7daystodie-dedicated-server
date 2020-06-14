https://superuser.com/questions/1527250/apt-update-error-with-ubuntu-18-10-cosmic-version
sed -i 's/us.archive/old-releases/g' input.txt
apt-get update

useradd -m steam
cd /home/steam

sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd 

sudo apt install steamcmd

steamcmd
login anonymous
force_install_dir  ./7dtd
app_update 294420
root@Getspace-VM5728-m5t:/# find . -name 7dtd
cd ./root/.steam/steamcmd/7dtd
./startserver.sh ./startserver.sh -configfile=serverconfig.xml
