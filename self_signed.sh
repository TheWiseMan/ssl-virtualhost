selfsigned_certificate=/etc/ssl/certs/btsciel_test/apache-selfsigned.crt
selfsigned_key=/etc/ssl/private/btsciel_test/apache-selfsigned.key

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout $selfsigned_key -out $selfsigned_certificate