m4_dnl vim:spell spelllang=de,en syntax=off

m4_changequote(`[[', `]]')
m4_define(M4_SRC_DIR,../src)

m4_ifelse([[Init Parameter aus https://mermaid-js.github.io/mermaid/#/./Setup]])
m4_define(M4_MERMAID,
m4_ifdef([[M4_GITHUB]],```mermaid,```{.mermaid format=svg loc=bilder filename="$1"})
$2```)

m4_define(M4_BILD,
![$1][[(]]m4_ifdef([[M4_GITHUB]],doc/bilder/$2[[[[)]]]],bilder/$2[[[[)]]]]{.zoomable width=600px})
)


m4_ifdef([[M4_GITHUB]],,
---
title: Tutorial Vue und Jakarta EE
author:  Bernhard Donaubauer 
date: 
---
)

Die Quellen und die Doku sind auf [https://github.com/bayerwald/maschinenDaten](https://github.com/bayerwald/maschinenDaten) zu finden.

# Aufgabe

In diesem Repository ist meine Version des Tutorials _Full-Stack Web Development with Jakarta EE and Vue.js_.


m4_ifelse([[

# Änderungen 

## Doku

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' maschinenDaten.m4 | sed -e '/^ *$/d']])


## Docker

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' ../docker | sed -e '/^ *$/d']])

## Maschinenscripte

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' ../maschinenscripte | sed -e '/^ *$/d']])

]])

