dnl $Id: Makefile.am.m4,v 1.11 2003/03/28 05:31:15 sit Exp $
dnl
dnl Process this file with GNU m4 to get Makefile.am.
dnl (Using m4 greatly simplifies the rules for autogenerated RPC files.)
dnl
## Process this file with automake to produce Makefile.in
## Do not edit this file directly.  It is generated from Makefile.am.m4

noinst_HEADERS = 

noinst_LTLIBRARIES = libsvc.la

dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl
dnl                                                                 dnl
dnl                MACROS FOR AUTOGENERATED RPC FILES               dnl
dnl                                                                 dnl
dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl

SUFFIXES = .x .C .h
.x.h:
	-$(RPCC) -h -DSFSSVC $< || rm -f $@
.x.C:
	-$(RPCC) -c -DSFSSVC $< || rm -f $@
$(RPCC):
	@:

define(`rpcmk_xfiles',)dnl
define(`rpcmk_headers',)dnl
define(`rpcmk_sources',)dnl
define(`rpcmk_built', `rpcmk_headers rpcmk_sources')dnl
define(`rpcmk',
changequote([[, ]])dnl
[[dnl
define(`rpcmk_xfiles', rpcmk_xfiles $1.x)dnl
define(`rpcmk_headers', rpcmk_headers $1.h)dnl
define(`rpcmk_sources', rpcmk_sources $1.C)dnl
$1.h: $1.x # $(RPCC)
$1.C: $1.x # $(RPCC)
$1.o: $1.h
$1.lo: $1.h
]]changequote)dnl

dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl
dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl

rpcmk(chord_types)
rpcmk(chord_prot)
rpcmk(dhash_prot)
rpcmk(sfsro_prot_cfs)
rpcmk(merkle_sync_prot)
rpcmk(transport_prot)

$(DEP_FILES): rpcmk_headers

EXTRA_DIST = Makefile.am.m4 .cvsignore
libsvc_la_SOURCES = rpcmk_sources

dnl sfsinclude_HEADERS = rpcmk_xfiles rpcmk_headers

dist-hook:
	cd $(distdir) && rm -f rpcmk_built

.PHONY: rpcclean
rpcclean:
	rm -f rpcmk_built

CLEANFILES = core *.core *~ *.rpo stamp-svc-repo rpcmk_built

MAINTAINERCLEANFILES = Makefile.in Makefile.am

$(srcdir)/Makefile.am: $(srcdir)/Makefile.am.m4
	@rm -f $(srcdir)/Makefile.am~
	$(M4) $(srcdir)/Makefile.am.m4 > $(srcdir)/Makefile.am~
	mv -f $(srcdir)/Makefile.am~ $(srcdir)/Makefile.am


