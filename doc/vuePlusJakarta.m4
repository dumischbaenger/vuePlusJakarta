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

Die Quellen und die Doku sind auf [https://github.com/dumischbaenger/vuePlusJakarta](https://github.com/dumischbaenger/vuePlusJakarta) zu finden.

# Vorwort

In diesem Repository ist meine Version des Tutorials _Full-Stack Web Development with Jakarta EE and Vue.js_.

# Vue

## Vorbereitungen

Um mit _Vue_ beginnen zu können, brauchen wir zuerst _node_, _npm_, _Vue CLI_ und _VS Code_.

### _node_ und _npm_ installieren

Für eine einfache und flexible Bereitstellung von _node_ benutzt man am einfachsten
_nvm_.


```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

nvm --version
0.40.3

nvm install 11.3
nvm use 11.3
node --version
v11.3.0

npm --version
6.4.1
```

### _Vue CLI_ installieren

```
npm install -g @vue/cli
vue --version
3.7.0
```

### _Visual Studio Code_ installieren

Das RPM Paket kann von https://code.visualstudio.com/ kopiert werden.

```
```

# Änderungen 

## Doku

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' vuePlusJakarta.m4 | sed -e '/^ *$/d']])


m4_ifelse([[

## Docker

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' ../docker | sed -e '/^ *$/d']])

## Maschinenscripte

m4_esyscmd([[git log --pretty='format:~~~%n%as %an %s%n%n%b%n~~~%n' ../maschinenscripte | sed -e '/^ *$/d']])

]])

