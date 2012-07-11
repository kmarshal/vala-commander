## Process this file with automake to produce Makefile.in

## Created by Anjuta



AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(VALA_COMMANDER_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = vala_commander

vala_commander_SOURCES = \
	vala_commander.vala config.vapi ui/menu.vala glade/main_window.ui signals/signals_window_menu.vala appconfig.vala ui/toolbutton_fixed.vala

vala_commander_VALAFLAGS =  \
	--pkg gtk+-3.0

vala_commander_LDFLAGS = \
	-Wl,--export-dynamic

vala_commander_LDADD = $(VALA_COMMANDER_LIBS)



SUBDIRS = \
	ui \
	glade \
	signals
