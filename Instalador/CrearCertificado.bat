cd "C:\cert\"
"C:\Program Files\OpenSSL-Win64\bin\openssl" genrsa 2048 > private.pem
"C:\Program Files\OpenSSL-Win64\bin\openssl" req -x509 -new -key private.pem -out public.pem
"C:\Program Files\OpenSSL-Win64\bin\openssl" pkcs12 -export -in public.pem -inkey private.pem -out mycert.pfx
pause