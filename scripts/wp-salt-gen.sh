# if [ $# -ne 1 ]; then
#     echo $0: usage: wp-salt-gen.sh /path/to wp-config.php
#     exit 1
# fi


echo "writing salts to ${1}/${2}"

find $1 -name $2 -print | while read line
do
    curl http://api.wordpress.org/secret-key/1.1/salt/ > /tmp/wp_keys.txt
    sed -i -e '/put your unique phrase here/d' -e \
    '/AUTH_KEY/d' -e '/SECURE_AUTH_KEY/d' -e '/LOGGED_IN_KEY/d' -e '/NONCE_KEY/d' -e \
    '/AUTH_SALT/d' -e '/SECURE_AUTH_SALT/d' -e '/LOGGED_IN_SALT/d' -e '/NONCE_SALT/d' $line
    cat /tmp/wp_keys.txt >> $line
    rm /tmp/wp_keys.txt
done
