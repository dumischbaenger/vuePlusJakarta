# vim: noet:ts=2:sw=2

CAT=cat
CD=cd
CHMOD=chmod
COMPILE_UMASK=umask u=rwx,g=rwx,o=rx
CP=cp
DIFF=diff
FIND=find

M4FLAGS+= -P  
M4=m4 
MKDIR=mkdir -p
MV=mv -f
NL=nl -ba -n ln
RM=rm -f
SED=sed
TEMP=/tmp
TEST=test
TOUCH=touch
VI=vim

SHELL=/bin/bash
.SHELLFLAGS= -c -o pipefail 

#BD inst - Dateien wegen der Uebersichtlichkeit in Unterverzeichnis ablegen
#INSTFILESDIR=./inst
#vpath %.inst $(INSTFILESDIR)
#vpath %.sinst $(INSTFILESDIR)

#BD Zeitpunkt (jetziger Zeitpunkt)
ZEITPUNKT:=$(shell date +"%Y-%m-%d-%H-%M-%S")
M4FLAGS+= -DM4_ZEITPUNKT=$(ZEITPUNKT)
TODAY:=$(shell date +"%Y-%m-%d")

HTML_HEADER_FILE:=header-includes.html
BASENAME:=vuePlusJakarta
M4_FILE:=$(BASENAME).m4
MD_FILE:=$(BASENAME).md
HTML_FILE:=$(BASENAME).html
HTMLSELF_FILE:=$(BASENAME).sc.html
HTMLPRINT_FILE:=$(BASENAME).pr.html
ZIP_FILE:=$(BASENAME).sc.zip
README_FILE:=../README.md

INCLUDES:=
PICS:=$(wildcard bilder/*.[pj][np][gg]) $(wildcard bilder/*/*.[pj][np][gg])
PICS:=$(filter-out %.1280.png, $(PICS))
PICS:=$(filter-out %.1280.jpg, $(PICS))
PICS1280:=$(PICS)
PICS1280:=$(patsubst %.png,%.1280.png,$(PICS1280))
PICS1280:=$(patsubst %.jpg,%.1280.jpg,$(PICS1280))


.PHONY: html htmlself htmlprint zip readme all clean

.SUFFIXES: .m4 .md .html .sc.html .pr.html .zip .png .1280.png .jpg .1280.jpg

#BD Suffix - Regeln
.m4.md:
	$(COMPILE_UMASK); $(M4) $(M4FLAGS) "$<"  > "$@"

.md.html:
	$(COMPILE_UMASK); pandoc -s --template=./easy_template.html -F mermaid-filter --toc --toc-depth 5 -M date="$(TODAY)" -H "$(HTML_HEADER_FILE)" -o "$@" "$<"

.md.sc.html:
	$(COMPILE_UMASK); pandoc -s --template=./easy_template.html -F mermaid-filter --toc --toc-depth 5 --self-contained -M date="$(TODAY)" -H "$(HTML_HEADER_FILE)" -o "$@" "$<"

.md.pr.html:
	$(COMPILE_UMASK); pandoc -s -F mermaid-filter --toc --toc-depth 5 --self-contained -M date="$(TODAY)" -H "$(HTML_HEADER_FILE)" -o "$@" "$<"

.png.1280.png:
	$(COMPILE_UMASK);  convert "$<" -resize "1280" -quality 75 -quiet "$@" 

.jpg.1280.jpg:
	$(COMPILE_UMASK);  convert "$<" -resize "1280" -quality 75 -quiet "$@" 

.html.zip:
	$(COMPILE_UMASK); zip "$@" "$<"


html: $(MD_FILE) $(HTML_FILE) $(PICS1280)

htmlself: $(MD_FILE) $(HTMLSELF_FILE) $(PICS1280)

htmlprint: $(MD_FILE) $(HTMLPRINT_FILE) $(PICS1280)

zip: $(ZIP_FILE)

readme: $(README_FILE)

$(MD_FILE): $(INCLUDES)

$(README_FILE): $(M4_FILE)
	m4 -P -DM4_GITHUB "$(M4_FILE)" > $(README_FILE)

all: html htmlself htmlprint zip readme

commit: all 
	git commit . ../README.md
	touch $(M4_FILE)
	$(MAKE) all
	git commit --amend --no-edit . ../README.md

clean:
	$(RM) $(MD_FILE) $(HTML_FILE) $(HTMLSELF_FILE) $(HTMLPRINT_FILE) $(ZIP_FILE) $(README_FILE) $(PICS1280)

dumpvars:
	@echo $(PICS)
	@echo $(PICS1280)
