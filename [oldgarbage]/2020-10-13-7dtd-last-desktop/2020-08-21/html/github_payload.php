<?php
if ( $_POST['payload'] ) {
shell_exec( "cd /home/steam/.steam/steamcmd/7dtd/; git reset --hard; git add *; git stash push --include-untracked; git pull origin master");
shell_exec("bash /var/www/html/announce_server_about_update.bash");
}

?>Github Handle Script loaded without errors.
