gnomemmwebsite_docdir = $(datadir)/doc/gnomemmwebsite-2.4

# Function: $(call vpath_listall,PATTERN ...)
# Get all filenames which match a PATTERN from the list.  Look for files
# relative to either the current directory or $(srcdir).  Strip $(srcdir)/
# again before returning and remove any duplicates.
vpath_srclist = $(patsubst $(srcdir)/%,%,$(wildcard $(addprefix $(srcdir)/,$(1))))
vpath_listall = $(sort $(wildcard $(1)) $(if $(srcdir:.=),$(vpath_srclist)))

XMLLINT = xmllint
XSLTPROC = xsltproc

DOC_MODULE = gnomemm-website
doc_module_with_ext = $(DOC_MODULE).xml
DOC_ENTITIES =
DOC_FIGURES =

# The names of any files included by xinclude (preferred):
DOC_INCLUDES = \
	books.xml \
	bugs.xml \
	commercial_support.xml \
	developers.xml \
	documentation.xml \
	download.xml \
	extra.xml \
	git.xml \
	index.xml \
	license.xml \
	mailinglist.xml \
	news.xml

DOC_LINGUAS = de es zh_CN

MAINTAINERCLEANFILES =  html/en/*.html $(srcdir)/html/en/*.html	\
			html/zh_CN/*.html $(srcdir)/html/zh_CN/*.html	\
			html/de/*.html $(srcdir)/html/de/*.html

tutorialdir         = $(gnomemmwebsite_docdir)/tutorial
tutorial_htmldir    = $(tutorialdir)/html
tutorial_figuresdir = $(tutorial_htmldir)/figures
tutorial_iconsdir   = $(tutorial_htmldir)/icons

tutorial_html_files = $(call vpath_listall,html/en/*.html) html/style/style.css
tutorial_html_inst  = $(foreach\
	file,$(tutorial_html_files),$(or $(wildcard $(file)),$(srcdir)/$(file)))

tutorial_xml_files  = $(addsuffix /gnomemm-website.xml,C $(DOC_LINGUAS))
tutorial_po_files   = $(foreach lang,$(lang)/$(lang).po,$(DOC_LINGUAS))

dist_noinst_DATA =		\
	C/gnomemm-website.xml	\
	$(tutorial_po_files)	\
	$(tutorial_xml_files)	\
	$(tutorial_html_files)

dist_tutorial_figures_DATA = $(addprefix C/,$(DOC_FIGURES))

dist_tutorial_icons_DATA =

include $(top_srcdir)/build/gnome-doc-utils.make

all-local: $(DOC_LINGUAS) $(addsuffix /gnomemm-website.xml,C $(DOC_LINGUAS)) html/en/index.html html/zh_CN/index.html html/de/index.html

$(DOC_LINGUAS):
	@$(MKDIR_P) $@

# Create a html generation of the C locale's version of the DocBook,
# using our custom stylesheet and graphics:
html/en/index.html: $(addprefix $(srcdir)/C/,$(doc_module_with_ext) $(DOC_INCLUDES))
  thelocale=en
	$(AM_V_at)rm -fr html/$(thelocale)
	$(AM_V_at)$(MKDIR_P) html/$(thelocale)
	$(AM_V_GEN)$(XSLTPROC) -o html/en/ --xinclude param.xsl $(srcdir)/C/$(doc_module_with_ext)

html/zh_CN/index.html: $(addprefix $(srcdir)/zh_CN/,$(doc_module_with_ext) $(DOC_INCLUDES))
  thelocale=zh_CN
	$(AM_V_at)rm -fr html/$(thelocale)
	$(AM_V_at)$(MKDIR_P) html/$(thelocale)
	$(AM_V_GEN)$(XSLTPROC) -o html/$(thelocale)/ --xinclude param.xsl $(srcdir)/$(thelocale)/$(doc_module_with_ext)

html/de/index.html: $(addprefix $(srcdir)/de/,$(doc_module_with_ext) $(DOC_INCLUDES))
  thelocale=de
	$(AM_V_at)rm -fr html/$(thelocale)
	$(AM_V_at)$(MKDIR_P) html/$(thelocale)
	$(AM_V_GEN)$(XSLTPROC) -o html/$(thelocale)/ --xinclude param.xsl $(srcdir)/$(thelocale)/$(doc_module_with_ext)

validate: $(addprefix $(srcdir)/C/,$(doc_module_with_ext) $(DOC_INCLUDES))
	$(XMLLINT) --xinclude --postvalid --noout $<


.PHONY: install-tutorial uninstall-tutorial

# Instruct GNU make to delete the targets of a rule after it failed, in
# order to avoid the complication of handling that situation manually.
.DELETE_ON_ERROR:








#Use jhbuild to get a graphiv .dot file,
#and use the graphviz dot utility to make a .png of it:
dependencies_gtkmm:
	jhbuild dot gtkmm > jhbuild_gtkmm.dot
	dot jhbuild_gtkmm.dot -Tpng > jhbuild_dot_gtkmm.png

dependencies_gnomemm:
	jhbuild dot gnomemm/libgnomeuimm > jhbuild_gnomemm.dot
	dot jhbuild_gnomemm.dot -Tpng > jhbuild_dot_gnomemm.png

# This is not relevant to C++, but it is interesting.
dependencies_gnome_desktop:
	jhbuild dot meta-gnome-desktop > html/jhbuild_gnome_desktop.dot
	dot jhbuild_gnome_desktop.dot -Tpng > html/jhbuild_dot_gnome_desktop.png




#Upload:

web_path = /home/murrayc/gtkmm.org/

#post-html: dependencies_gtkmm dependencies_gnomemm dependencies_gnome_desktop
post-html:
	rsync -avz --rsh ssh --cvs-exclude  html/.htaccess html/* $$USER@www.gtkmm.org:$(web_path)