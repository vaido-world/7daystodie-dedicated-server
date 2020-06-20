Use Btivise SSH client 8.43


https://superuser.com/questions/1527250/apt-update-error-with-ubuntu-18-10-cosmic-version
sed -i 's/us.archive/old-releases/g' input.txt
apt-get update

su -

fix do-release-upgrade: command not found error
sudo apt install ubuntu-release-upgrader-core


useradd -m steam
usermod --append --groups sudo steam
passwd steam
cd /home/steam
su steam


sudo apt update 
sudo apt upgrade
// sudo apt dist-upgrade

Fix add-apt-repository: command not found error
sudo apt-get install software-properties-common


sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd 

//sudo apt install steamcmd

steamcmd
login anonymous
force_install_dir  ./7dtd
app_update 294420
root@Getspace-VM5728-m5t:/# find . -name 7dtd
cd ./root/.steam/steamcmd/7dtd
./startserver.sh ./startserver.sh -configfile=serverconfig.xml

screen

[1gb ram server]
root@Getspace-VM5728-m5t:~/.steam/steamcmd/7dtd/7DaysToDieServer_Data# nano  output_log__2020-06-14__09-15-56.txt

OutOfMemoryException: Out of memory
  at (wrapper managed-to-native) System.Object.__icall_wrapper_ves_icall_array_new_specific(intptr,$
  at TGALoader.LoadTGAAsArrayThreaded (System.String fileName, System.Int32& w, System.Int32& h) [0$
  at ChunkProviderGenerateWorldFromRaw+<Init>d__17.MoveNext () [0x0097a] in <547af08b786b418cbfcf3e$
  at UnityEngine.SetupCoroutine.InvokeMoveNext (System.Collections.IEnumerator enumerator, System.I$

(Filename: <547af08b786b418cbfcf3ef2ec18045a> Line: 0)


[2gb ram server]

In the serverconfig.xml

<property name="GameWorld"						value="RWG"/>			<!-- "RWG" (see WorldGenSeed and WorldGenSize options below) or any already existing world name in the Worlds folder (currently shipping with e.g. "Navezgane", "PREGEN01", ...) -->
	<property name="WorldGenSeed"					value="asdf"/>				<!-- If RWG this is the seed for the generation of the new world. If a world with the resulting name already exists it will simply load it -->
	<property name="WorldGenSize"					value="2048"/>				<!-- If RWG this controls the width and height of the created world. It is also used in combination with WorldGenSeed to create the internal RWG seed thus also creating a unique map name even if using the same WorldGenSeed. Has to be between 2048 and 16384, though large map sizes will take long to generate / download / load -->
	
	
Generating World was unsuccessful, 2gb of RAM is not enough.


On Windows 10 The generated worlds are stored in C:\Users\vaida\AppData\Roaming\7DaysToDie
