openssl rsautl -encrypt -inkey user-public.pem -pubin -in file.txt -out file.ssl
openssl rsautl -decrypt -inkey user-private.pem -in file.ssl -out decrypted.txt