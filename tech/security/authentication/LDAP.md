---
visibility: public
title: LDAP
category:
  - directory-service
  - authentication
type: networking/protocol
ports:
  - 636 (Secure LDAP)
---
Lightweight Directory Access Protocol

- centralised information storage
- user authentication
- email messaging
- calendar services
- access control
- communication encrypted with TLS
- supports multiple backend databases

Terminology

Term | Explanation
-|-
Directory | specialised database storing information about objects such as people, profiles, printers, computers, ...
entry | single unit in a LDAP directory
attribute | detail of an entry
matching rule | search criteria for matching entries
object class | structure of required and optional attributes for an entry
schema | package/bundle of attributes, object classes and matching rules
LDIF | plaintext representation of a LDAP entry (platform-independent)
*Distinguished Name (DN)* | unique identifier for entry
*Relative Distinguished Name (RDN)* | unique identifier for components of an entry

Attributes

- type (describes information) and value (data) pairs
- *Common Name (CN)*
- *Domain Component (DC)*
- Country©
- Mail (mail)
- Address (streetAddress)
- *Organisational Unit (OU)*
- *Surname (SN)*
- telephone number (telephoneNumber)

# OpenLDAP

Tags: #sw/openLDAP

- supports LDAPv3
- [[networking#Simple Authentication Security Layer (SASL)|SASL]]
- [[networking#Transport Layer Security (TLS)|TLS]]
- [[networking#Secure Sockets Layer (SSL)|SSL]]
- LDAP over IPC (Inter Process Communication): enhances security by allowing local communication instead of network
- IPv6
- CAPI for program access

Packages

- openldap
- openldap-client
- openldap-servers
- nss-pam-ldap: LDAP name service for local queries
- mod_ldap: LDAP authentication for Apache web server
- compat-openldap: LDAP compatibility libraries for applications
- openldap-servers-sql: allows OpenLDAP to use relational database back-ends

## Server: slap

```bash
slapacl    # check access to attributes
slapadd    # add entried from LDIF file
# changes need to be joined into LDAP by root
slapauth   # check IDs for authentication permissions
slapcat    # query entries and saves as LDIF
slapdn     # check DNs against schema
slapindex  # reindex the directory
slappasswd # create encrypted user password
slapschema # check compliance of DB with schema
slaptest   # check LDAP server configuration
# when running slapadd, slapcat or slapindex stop slapd service
```

## Client: ldap

```bash
ldapadd # add entries
ldapcompare # compare attributes with entry
ldapdelete # delete entry
ldapmodify # modify entries
ldapmodrdn # modify RDN value
ldappasswd # set password of LDAP user
ldapsearch # query LDAP entries
```

## Examples

```bash
ldapsearch -x cn=pxxxxxx
```

## References

- [[LIL_LDAP_Kerberos|LinkedIn Learning course Authentication with LDAP and Kerberos]]
- <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/configuring-sssd-to-use-ldap-and-require-tls-authentication_configuring-authentication-and-authorization-in-rhel>
- [Blog: SSSD LDAP without TLS](https://www.analogous.dev/blog/sssd-without-tls/)
