#!/usr/bin/make -f
####################################################################
##### This file is automagically generated -- edit at your own risk
#####
##### Copyright (c) 1998-2010 Richard Nelson.  All Rights Reserved.
#####
##### file: /etc/mail/Makefile		Makefile for Sendmail databases
##### generated via: (/usr/bin/perl v5>34.0)
#####		/usr/share/sendmail/update_mk
#####		version: 8.15.2 2021-12-09 00:18:01 cowboy
##### by: j@b3
##### on: Wed Jan 18 09:35:58 2023
##### in: /
##### input files: /etc/mail/databases
#####
##### Usage:
#####	1) Make all targets upto date - use one of the following:
#####		A) `(cd /etc/mail && make)`
#####		B) `make -f /etc/mail/Makefile`
#####		C) `/etc/mail/Makefile`
#####	2) Force update of <target> - Add <target> to one of the
#####	   prior commands ie, `/etc/mail/Makefile access`.  Most
#####	   any reasonable <target> value is accepted.
#####
####################################################################
SHELL=/bin/sh

#
# targets that will be routed to the /etc/init.d/sendmail script
# NOTE: newaliases and clean removed due to extant rules
#
INIT = start stop restart restart-if-running \
       reload-if-running reload force-reload \
       hoststat purgestat mailstats mailq runq control \
       status debug

.SUFFIXES:
.PRECIOUS: /etc/mail/Makefile

#
# all, the default target, will update everything
#
.PHONY: all
all: sendmail /var/run/sendmail/stampdir/reload

#
# route to the /etc/init.d/sendmail script
#
.PHONY: $(INIT)
$(INIT): FORCE
	/etc/init.d/sendmail $@


#
# clean target, remove {sendmail,submit}.cf and generated databases
#
.PHONY: clean
clean: FORCE
	rm -f /etc/mail/databases;
	rm -f /etc/cron.d/sendmail;
	rm -f /etc/mail/submit.cf;
	rm -f /etc/mail/access.db;
	rm -f /etc/mail/aliases.db;

#
# restart target, check to see if sendmail needs to be restarted
#
.PHONY: noreload norestart
noreload norestart: FORCE
	@su smmsp -s /bin/sh -c "touch /var/run/sendmail/stampdir/reload"

.PHONY: should_reload should_restart
should_reload should_restart: FORCE
	@rm -f /var/run/sendmail/stampdir/reload;
	@$(MAKE) -sf /etc/mail/Makefile /var/run/sendmail/stampdir/reload;

/var/run/sendmail/stampdir/reload: \
	/etc/mail/relay-domains \
	/etc/mail/sendmail.conf \
	/etc/mail/sendmail.cf \
	/etc/mail/submit.cf \
	/etc/mail/local-host-names
	@if [ ! -f $@ ]; then \
		echo 'A forced reload...'; \
	else \
		echo 'The following file(s) have changed:'; \
		echo '  $?'; \
		fi;
	@echo '** ** You should issue `/etc/init.d/sendmail reload` ** **';

#
# sendmail targets, depend upon *ALL* relevant files/databases
#
.PHONY: sendmail
sendmail: sendmail_files sendmail_dbs

.PHONY: sendmail_files
sendmail_files: \
	/etc/mail/sendmail.mc \
	/etc/mail/databases \
	/etc/mail/submit.mc \
	/etc/mail/access \
	/etc/mail/sasl/sasl.m4 \
	/usr/share/sendmail/cf/m4/cf.m4 \
	/usr/share/sendmail/cf/ostype/debian.m4 \
	/usr/share/sendmail/cf/debian/autoconf.m4 \
	/usr/share/sendmail/cf/domain/debian-mta.m4 \
	/etc/mail/m4/dialup.m4 \
	/etc/mail/m4/provider.m4 \
	/etc/mail/tls/starttls.m4 \
	/etc/mail/aliases \
	/etc/mail/relay-domains \
	/etc/mail/local-host-names

.PHONY: sendmail_dbs
sendmail_dbs: \
	/etc/mail/databases \
	/etc/mail/Makefile \
	/etc/cron.d/sendmail \
	/etc/mail/sendmail.cf \
	/etc/mail/submit.cf \
	/etc/mail/access.db \
	/etc/mail/aliases.db

#
# Individual database targets
#

#
# Default db type is hash (Must be in /etc/mail, or
# fully qualify the dataset for this target to work)
#
%.db: % FORCE
	@echo 'Updating $@...';
	@if [ -x /usr/sbin/makemap ]; then \
		/usr/sbin/makemap hash $@.new.db < $<; \
		chown root:smmsp $@.new.db; \
		chmod 0640 $@.new.db; \
		mv -f $@.new.db $@; \
		fi;

.PHONY: databases parse_mc 
databases parse_mc : FORCE
	@rm -f /etc/mail/databases ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/databases ;
/etc/mail/databases : /etc/mail/sendmail.mc /usr/share/sendmail/cf/m4/cf.m4 /usr/share/sendmail/cf/ostype/debian.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /usr/share/sendmail/cf/domain/debian-mta.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /etc/mail/m4/dialup.m4 /etc/mail/m4/provider.m4
	@echo 'Updating databases ...';
	@if [ -x /usr/share/sendmail/parse_mc ]; then \
		/usr/share/sendmail/parse_mc || true; \
		chown root:smmsp /etc/mail/databases; \
		chmod 0644 /etc/mail/databases; \
		fi;

.PHONY: makefile make update_mk 
makefile make update_mk : FORCE
	@touch  /etc/mail/databases;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/Makefile ;
/etc/mail/Makefile : /etc/mail/databases
	@echo 'Updating Makefile ...';
	@if [ -x /usr/share/sendmail/update_mk ]; then \
		/usr/share/sendmail/update_mk || true; \
		chown root:smmsp /etc/mail/Makefile; \
		chmod 0754 /etc/mail/Makefile; \
		fi;

.PHONY: crontab cron update_conf 
crontab cron update_conf : FORCE
	@rm -f /etc/cron.d/sendmail ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/cron.d/sendmail ;
/etc/cron.d/sendmail : /etc/mail/sendmail.conf
	@echo 'Updating crontab ...';
	@if [ -x /usr/share/sendmail/update_conf ]; then \
		/usr/share/sendmail/update_conf || true; \
		fi;

.PHONY: sendmail.cf 
sendmail.cf : FORCE
	@rm -f /etc/mail/sendmail.cf ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/sendmail.cf ;
/etc/mail/sendmail.cf : /etc/mail/sendmail.mc /usr/share/sendmail/cf/m4/cf.m4 /usr/share/sendmail/cf/ostype/debian.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /usr/share/sendmail/cf/domain/debian-mta.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /etc/mail/m4/dialup.m4 /etc/mail/m4/provider.m4
	@echo 'Updating sendmail.cf ...';
	@rm -f /etc/mail/sendmail.cf.errors
	@m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf.new \
		2> /etc/mail/sendmail.cf.errors || true; 
	@echo "### /etc/mail/sendmail.mc ###" \
		>> /etc/mail/sendmail.cf.new; 
	@sed -e 's/^/# /' /etc/mail/sendmail.mc \
		>> /etc/mail/sendmail.cf.new; 
	@chown root:smmsp /etc/mail/sendmail.cf.new; 
	@chmod 0644 /etc/mail/sendmail.cf.new; 
	@mv -f /etc/mail/sendmail.cf.new /etc/mail/sendmail.cf; 
	@if [ -s /etc/mail/sendmail.cf.errors ]; then \
		chown root:smmsp /etc/mail/sendmail.cf.errors; \
		cat /etc/mail/sendmail.cf.errors; \
	else \
		rm -f /etc/mail/sendmail.cf.errors; \
		fi; 

.PHONY: submit.cf 
submit.cf : FORCE
	@rm -f /etc/mail/submit.cf ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/submit.cf ;
/etc/mail/submit.cf : /etc/mail/submit.mc
	@echo 'Updating submit.cf ...';
	@rm -f /etc/mail/submit.cf.errors
	@if [ -f /usr/share/sendmail/cf/feature/msp.m4 ]; then \
		m4 /etc/mail/submit.mc > /etc/mail/submit.cf.new \
			2> /etc/mail/submit.cf.errors || true; \
		echo "### /etc/mail/submit.mc ###" \
			>> /etc/mail/submit.cf.new; \
		sed -e 's/^/# /' /etc/mail/submit.mc \
			>> /etc/mail/submit.cf.new; \
		chown root:smmsp /etc/mail/submit.cf.new; \
		chmod 0644 /etc/mail/submit.cf.new; \
		mv -f /etc/mail/submit.cf.new /etc/mail/submit.cf; \
		if [ -s /etc/mail/submit.cf.errors ]; then \
			chown root:smmsp /etc/mail/submit.cf.errors; \
			cat /etc/mail/submit.cf.errors; \
		else \
			rm -f /etc/mail/submit.cf.errors; \
			fi; \
		fi;

.PHONY: access_db access.db access 
access_db access.db access : FORCE
	@rm -f /etc/mail/access.db ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/access.db ;
/etc/mail/access.db : /etc/mail/access
	@echo 'Updating access_db ...';
	@if [ -x /usr/sbin/makemap ]; then \
		/usr/sbin/makemap hash /etc/mail/access.new.db \
			< /etc/mail/access; \
		chown smmta:smmsp /etc/mail/access.new.db; \
		chmod 0640 /etc/mail/access.new.db; \
		mv -f /etc/mail/access.new.db /etc/mail/access.db; \
		fi;

.PHONY: auth update_auth 
auth update_auth : FORCE
	@rm -f /etc/mail/sasl/sasl.m4 ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/sasl/sasl.m4 ;
/etc/mail/sasl/sasl.m4 : 
	@echo 'Updating auth ...';
	@if [ -x /usr/share/sendmail/update_auth ]; then \
		/usr/share/sendmail/update_auth || true; \
		fi;

.PHONY: includes
includes : /usr/share/sendmail/cf/m4/cf.m4 /usr/share/sendmail/cf/ostype/debian.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /usr/share/sendmail/cf/domain/debian-mta.m4 /usr/share/sendmail/cf/debian/autoconf.m4 /etc/mail/m4/dialup.m4 /etc/mail/m4/provider.m4

.PHONY: tls update_tls 
tls update_tls : FORCE
	@rm -f /etc/mail/tls/starttls.m4 ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/tls/starttls.m4 ;
/etc/mail/tls/starttls.m4 : 
	@echo 'Updating tls ...';
	@if [ -x /usr/share/sendmail/update_tls ]; then \
		/usr/share/sendmail/update_tls || true; \
		fi;

.PHONY: ALIAS_FILE newaliases aliases.db aliases 
ALIAS_FILE newaliases aliases.db aliases : FORCE
	@rm -f /etc/mail/aliases.db ;
	@$(MAKE) -sf /etc/mail/Makefile /etc/mail/aliases.db ;
/etc/mail/aliases.db : /etc/mail/aliases
	@echo 'Updating ALIAS_FILE ...';
	@if [ -x /usr/sbin/sendmail ]; then \
		/usr/sbin/sendmail -bi || true; \
		if [ -f /etc/mail/aliases.db ]; then \
			chown smmta:smmsp /etc/mail/aliases.db; \
			chmod 0644 /etc/mail/aliases.db; \
			fi; \
		fi;

#
# Individual file targets - create any requisite files
#

/etc/mail/sendmail.conf:
	@echo 'Creating /etc/mail/sendmail.conf';
	@/usr/share/sendmail/update_conf;

/etc/mail/sendmail.mc:
	@echo 'Creating /etc/mail/sendmail.mc';
	@/usr/sbin/sendmailconfig --no-reload;

/etc/mail/submit.mc:
	@echo 'Creating /etc/mail/submit.mc';
	@cp /usr/share/sendmail/cf/debian/submit.mc \
		/etc/mail/submit.mc;
	@chown root:smmsp /etc/mail/submit.mc;
	@chmod 0644 /etc/mail/submit.mc;

/etc/mail/access:
	@echo 'Creating /etc/mail/access';
	@cp /usr/share/sendmail/examples/db/access \
		/etc/mail/access;
	@chown smmta:smmsp /etc/mail/access;
	@chmod 0640 /etc/mail/access;

/etc/mail/aliases:
	@echo 'Creating /etc/mail/aliases';
	@ln -s ../aliases /etc/mail/aliases

/etc/mail/relay-domains:
	@echo 'Creating /etc/mail/relay-domains';
	# Optional file...

/etc/mail/local-host-names:
	@echo 'Creating /etc/mail/local-host-names';
	@touch /etc/mail/local-host-names;
	@chown root:smmsp /etc/mail/local-host-names;
	@chmod 0644 /etc/mail/local-host-names;

#
# FORCE target, allow one to override dependancies
#
.PHONY: FORCE
FORCE: ;

