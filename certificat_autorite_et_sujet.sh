auth_private_key=auth-private.key
auth_certificate=auth.crt
user_private_key=user-private.pem
user_public_key=user-public.pem
certificate_request=user.csr
user_certificate=user.crt

echo "====  INFORMATIONS SUR L'AUTORITE ===="
# Création de l'autorité de certification
openssl genrsa -out $auth_private_key 4096 # Clé privée de l'autorité
openssl req -x509 -new -nodes -key $auth_private_key -sha256 -days 1826 -out $auth_certificate
# ^ Certificat d'identité de l'autorité (ici auto-signé)

openssl genrsa -out $user_private_key 2048 # pour générer la clé privée
# openssl rsa -in user-private.pem -text # pour voir la clé privée

openssl rsa -in $user_private_key -out $user_public_key -pubout # pour générer la clé publique
#openssl rsa -in user-public.pem -pubin -text # pour voir la clé publique

echo "====  INFORMATIONS SUR LE SUJET   ===="
openssl req -new -key $user_private_key -out $certificate_request

#openssl x509 -req -days 365 -in $certificate_request -signkey $auth_private_key -out $certificate
# Ajout des informations sur l'autorité au certificat
# et signature de la requête de certificat
openssl x509 -req -days 365 -in $certificate_request \
 -CA $auth_certificate -CAkey $auth_private_key -out $user_certificate

echo "Le certificat est disponible à : $user_certificate"
echo "La clé privée est disponible à : $user_private_key"