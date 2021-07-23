# Install Apache2 and PHP
sudo apt-get install apache2 -y
sudo apt-get install php -y

# Setup Github Payload Handle
# For debugging look in /var/log/apache2/error.log
sudo bash -c '
cat <<"EOF" > /var/www/html/github_payload.php
<?php
if ( $_POST['payload'] ) {
	shell_exec( "cd /home/steam/.steam/steamcmd/7dtd/; git reset --hard HEAD; git stash push --include-untracked; git pull origin master");
	shell_exec('./var/www/html/newfile.bash'); 
}

?>Github Handle Script loaded without errors
EOF'
	


# Setup Permissions for the PHP command line user named "www-data".
sudo chgrp www-data /home/steam/.steam/steamcmd/7dtd/.git/FETCH_HEAD
sudo chgrp www-data /home/steam/.steam/steamcmd/7dtd/.git
sudo chgrp www-data /home/steam/.steam/steamcmd/7dtd/.git/objects

sudo chmod -R 0777 /home/steam/.steam/steamcmd/7dtd/
sudo chmod -R 0777 /home/steam/.steam/steamcmd/7dtd/.git
sudo chmod -R 0777 /home/steam/.steam/steamcmd/7dtd/.git/objects
