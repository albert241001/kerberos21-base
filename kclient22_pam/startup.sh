#! /bin/bash
mv krb5.conf /etc/krb5.conf
mv comm* /etc/pam.d/

for user in local01 local02 local03
do
  useradd $user
  echo -e "$user\n$user\n" | passwd $user  
done	

for user in kuser01 kuser02 kuser03 kuser04 kuser05 kuser06
do
  useradd $user
done
