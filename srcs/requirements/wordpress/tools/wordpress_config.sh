#!/bin/bash

service php7.4-fpm start

# set connection to database
sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wordpress/wp-config.php

# active debug
sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/" /var/www/html/wordpress/wp-config.php

sed -i '0,/put your unique phrase here/s/put your unique phrase here/@nd=Z-K5J[}bXE7ZihAZ<x-j+ErI@>%(PPr+yi KV{K4iO{N+`4#$k$:x1D^B,0I/' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s/put your unique phrase here/5zesm:{i1q?B:u#o*\&jw}|3*~8=7pCJ]=+]Q|Ro_3|jIlxC:\&$A8^Tna=-t|{!.;/' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s/put your unique phrase here/2JJI7!%mT>qm(wD+RZ<!+Q6D-2T+~V[mvP3V:ZV|EFWi r\&}L2X_hX}fWmL[K\&?3/' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s/put your unique phrase here/,-cl:z5raHF3fuT7jyy^bNJ-Y@@!KowW`y8i2xukb}aHQ~V2<MU~8|RKE4]([FLB/' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s#put your unique phrase here#z6c(_IcL;8Q8-z!jt{e7q,Sy/)d-4W|i3Rt1:g:3v8^-;k^7(@gZm8XSqsi_.-}U#' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s@put your unique phrase here@(=T5G|b0L[Q5J+=V V,W*l|To:~lMG~+V!kC/k!Yb.#bIb;|.wZSaAC]zur2F8-^@' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s/put your unique phrase here/O~iFoA4fh}]Uj_i)s|=wg*;0KJA4]m04~B|@QXh0PyA-B1~%=3Ukv|`=6?FQiF){/' /var/www/html/wordpress/wp-config.php
sed -i '0,/put your unique phrase here/s|put your unique phrase here|^!9[kAQp]:]TRZjF,]~bO!=FkASj5>DmU#j+4<J@\&P)4ATTTRS@{P~H<x/02y4Lf|' /var/www/html/wordpress/wp-config.php

# cat /var/www/html/wordpress/wp-config.php

# cat /etc/php/7.4/fpm/pool.d/wordpress.conf

rm /etc/php/7.4/fpm/pool.d/www.conf
# sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm stop
php-fpm7.4 -t
# sleep infinity
exec "$@"