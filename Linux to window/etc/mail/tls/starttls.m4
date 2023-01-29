divert(-1)dnl
####################################################################
##### This file is automagically generated -- edit at your own risk
#####
##### Copyright (c) 2002-2010 Richard Nelson.  All Rights Reserved.
#####
##### file: /etc/mail/tls/starttls.m4
#####		STARTTLS Configuration for Debian Sendmail
##### generated via: (/usr/bin/perl v5>34.0)
#####		/usr/share/sendmail/update_tlsm4
#####		version: 8.15.2 2021-12-09 00:18:01 cowboy
##### by: j@b3
##### on: Wed Jan 18 09:35:57 2023
##### in: /
##### input files: /etc/mail/databases
#####
##### Usage:
#####	1) To get *ANY* STARTTLS support for sendmail you
#####		A) *MUST* Add this line to /etc/mail/sendmail.mc
#####		   `include(`/etc/mail/tls/starttls.m4')dnl'
#####		B) *MAY* Add the same line to /etc/mail/submit.mc
#####		   to get MSP<->MTA authentication/encryption
#####	2) You may modify the marked portions of this file, those
#####	   deal with the cert/key filenames and TLS options.
#####	   If you need finer control of TLS options, use the access
#####	   database.
#####
####################################################################
divert(0)dnl
VERSIONID(`$Id: starttls.m4,v 8.15.2-22ubuntu3 2021-12-09 00:18:01 cowboy Exp $')
dnl #
dnl #---------------------------------------------------------------------
dnl # Bring in Autoconf results
dnl #---------------------------------------------------------------------
ifdef(`sm_version', `dnl',
`include(`/usr/share/sendmail/cf/debian/autoconf.m4')dnl')
dnl #
dnl # Check to see if inclusion is valid (version >= 8.11.0, tls enabled)
ifelse(eval(sm_version_math >= 527104), `1', `dnl
ifelse(sm_enable_tls, `yes', `dnl
dnl #
dnl # To support shared keyfiles, we need them to be group readable
dnl #
define(`confDONT_BLAME_SENDMAIL',dnl
	defn(`confDONT_BLAME_SENDMAIL')`,GroupReadableKeyFile')dnl
dnl #
dnl #             ...Do not touch anything above this line...
dnl #
dnl # Set a more reasonable timeout on negotiation
dnl #
define(`confTO_STARTTLS',     `2m')dnl   # <= EDIT
dnl #
dnl # CA directory - CA certs should be herein
define(`confCACERT_PATH',     `/etc/ssl/certs')dnl   # <= EDIT
dnl #
dnl # CA file (may be the same as client/server certificate)
define(`confCACERT',           `/etc/mail/tls/sendmail-server.crt')dnl   # <= EDIT
dnl #
dnl # Certificate Revocation List
define(`confCRL',              `')dnl   # <= EDIT
dnl # CRL not found...  do not issue warnings on it!
undefine(`confCRL')dnl
dnl #
dnl # Server certificate/key (can be in the same file, and shared w/client)
dnl # NOTE: The key must *NOT* be encrypted !!!
define(`confSERVER_CERT',     `/etc/mail/tls/sendmail-server.crt')dnl   # <= EDIT
define(`confSERVER_KEY',      `/etc/mail/tls/sendmail-common.key')dnl   # <= EDIT
dnl #
dnl # Client certificate/key (can be in the same file, and shared w/server)
dnl # NOTE: The key must *NOT* be encrypted !!!
define(`confCLIENT_CERT',     `/etc/mail/tls/sendmail-client.crt')dnl   # <= EDIT
define(`confCLIENT_KEY',      `/etc/mail/tls/sendmail-common.key')dnl   # <= EDIT
dnl #
dnl # DH parameters
define(`confDH_PARAMETERS',   `/etc/mail/tls/sendmail-common.prm')dnl # <= EDIT
dnl #
dnl # Optional settings
define(`confTLS_SRV_OPTIONS', `V')dnl   # <= EDIT
dnl #
')')dnl
