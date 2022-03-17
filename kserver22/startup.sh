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
 
kadmin.local -q "addprinc -pw kmarta marta/admin"
kadmin.local -q "addprinc -pw kpere pere/admin"
kadmin.local -q "addprinc -pw kpau  pau/admin"
kadmin.local -q "addprinc -pw ksuper super"
kadmin.local -q "addprinc -pw kadmin admin "

kadmin.local -q "addprinc -randkey host/sshd.edt.org"

/usr/sbin/krb5kdc
/usr/sbin/kadmind -nofork
