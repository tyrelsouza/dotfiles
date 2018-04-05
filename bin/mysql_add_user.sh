#! /bin/bash

newUser='klaviyo'
newDbPassword='oyivalk'
newDb='test_klaviyo'
host=localhost
#host='%'
 
commands="CREATE DATABASE \`${newDb}\`;GRANT USAGE ON *.* TO '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT ALL privileges ON \`${newDb}\`.*
TO '${newUser}'@'${host}';FLUSH PRIVILEGES;"

echo "${commands}" | mysql -u root
