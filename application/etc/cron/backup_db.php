<?php

include_once '../../../config/configDb.php';

exec("mysqldump -u'$user' -p'$pass' '$dbname' > backups/" . date('d.m.Y-H:i:s') . ".sql");
