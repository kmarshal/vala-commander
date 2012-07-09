## Process this file with automake to produce Makefile.in
## Created by Anjuta

SUBDIRS = src 

vala_commanderdocdir = ${prefix}/doc/vala_commander
vala_commanderdoc_DATA = \
	README\
	COPYING\
	AUTHORS\
	ChangeLog\
	INSTALL\
	NEWS


EXTRA_DIST = $(vala_commanderdoc_DATA)


# Remove doc directory on uninstall
uninstall-local:
	-rm -r $(vala_commanderdocdir)
