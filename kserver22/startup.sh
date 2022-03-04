#! /bin/bash
mv kadm5.acl /etc/krb5kdc/kadm5.acl
mv krb5.conf /etc/krb5.conf
mv ldap.conf /etc/ldap.conf
mv kdc.conf /etc/krb5kdc/kdc.conf

kdb5_util create -s -P masterkey

for user in anna pere marta jordi pau kuser{01..10} 
do
  kadmin.local -q "addprinc -pw k$user $user"
done 

/usr/sbin/krb5kdc
/usr/sbin/kadmind -nofork
