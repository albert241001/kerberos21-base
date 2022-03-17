#! /bin/bash
mv krb5.conf /etc/krb5.conf
mv sshd_config /etc/ssh/sshd_config
mv ssh_config /etc/ssh/ssh_config

kadmin -p marta -w kmarta -q "ktadd -k /etc/krb5.keytab host/sshd.edt.org"

for user in local01 local02 local03
do
  useradd $user
  echo -e "$user\n$user\n" | passwd $user  
done	

for user in anna pere marta jordi pau kuser01 kuser02 kuser03 kuser04 kuser05 kuser06
do
  useradd $user
done
 
