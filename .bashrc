#!/bin/bash
# important to carry out group permission settings... (bct 12/3/04)
umask 002

# This prevents the PATH getting nested when bashrc sourced more than once
unset PATH
ulimit -s 100000
ulimit -u 10000

# Active project
PROJ="/usr/local/projects"
ARCHIVE="/usr/local/archive/projects"
BOG="$PROJ/BOG"
MTG3="$PROJ/MTG3"
MTG4="$PROJ/MTG4"
#SCRATCH="/usr/local/scratch/htang"
SCRATCH="$MTG4/htang"
PACKAGES=/usr/local/packages

# Gigantic path
export MACHTYPE=i486
PATH=$SCRATCH/export/MaSuRCA-2.0.3.1/bin/:$PATH
PATH=/usr/local/projects/tgi/bin:/usr/local/common:$PATH
#PATH=/usr/local/devel/BCIS/external_software/clc-assembly-cell-4.0.1beta-linux_64:$PATH
PATH=/usr/local/packages/clc-ngs-cell:$PATH
PATH=$HOME/bin/java/jdk1.6.0_13/bin:$PATH
PATH=$HOME/bin/gepard-1.30/:$PATH
PATH=$HOME/bin/FastQC/:$PATH
PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin/bio:/usr/X11R6/bin:/sbin:/usr/sbin:$PATH
PATH=.:$HOME/bin:$HOME/bin/$MACHTYPE:$HOME/bin/Linux-amd64/bin:$PATH
PATH=$SCRATCH/bin:$PATH
export PATH

#AUGUSTUS_CONFIG_PATH=$HOME/htang/export/augustus.2.5.5/config
AUGUSTUS_CONFIG_PATH=$HOME/htang/export/maker/exe/augustus/config
export AUGUSTUS_CONFIG_PATH
PYTHONPATH=.:${PACKAGES}/python/lib/python2.7/site-packages:$HOME/lib/python2.7/site-packages/:$HOME/lib/python2.6/site-packages
#PYTHONPATH=$PYTHONPATH:~/htang/medicago/PacBio/smrtanalysis-1.4.0/analysis/lib/python2.7/
PYTHONPATH=$SCRATCH/export/khmer/python:$PYTHONPATH
PYTHONPATH=$HOME/code:$PYTHONPATH
export PYTHONPATH

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

# User specific aliases and functions
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\](\w) \$ \[\033[00m\]'

# Ignore small spelling mistakes in directory names
shopt -s cdspell
# Multiple line commands stay together in the history
shopt -s cmdhist
# Verify command before running it
shopt -s histverify
# Auto correct the case
shopt -s nocaseglob
shopt -s extglob
shopt -s nullglob dotglob
shopt -s checkhash
shopt -s cdable_vars
shopt -s no_empty_cmd_completion

# These set up/down to do the history searching
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# Don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups    # ignore and erase duplicate entries

# Big big history
export HISTSIZE=100000

# Make bash append the history rather than overwrite it
shopt -s histappend       # append to history, don't overwrite it

# Ignore some of the common commands
export HISTIGNORE="&:ls:[bf]g:exit:ll:la:l:cd:pwd:su:df:clear:cd ..:history"

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Import CentOS grid settings
SGE=/usr/local/sge_current/jcvi/common/settings.sh
if [ -r "$SGE" ]; then . $SGE; else echo "Missing $SGE - contact sysadmin."; fi

# Use environment, i.e. use java160
use () { eval `/usr/local/packages/usepackage/bin/usepackage -b $*` ; }

alog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }
blog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/access.log ; }
aless () { command less /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }

# Compiler
alias makeperl='perl Makefile.PL lib=/usr/lib/perl5/site_perl'
alias mpmi='makeperl; make install'
alias mpmix='perl Makefile.PL; make install'
alias easy_install='easy_install -UZ --prefix=$HOME'
alias easy_uninstall='easy_install -mxN'
alias configure='configure --prefix=$SCRATCH'

# My Python utility programs
alias grid='python -m jcvi.apps.grid'
alias fasta='python -m jcvi.formats.fasta'
alias gff='python -m jcvi.formats.gff'
alias agp='python -m jcvi.formats.agp'
alias goldenpath='python -m jcvi.assembly.goldenpath'
alias fastq_to_fasta='fastq_to_fasta_fast'

alias qsub='qsub -P 04048 -cwd'
alias qlogin='qlogin -P 04048'
alias sqsh='sqsh -S SYBPROD'
alias java='java -Xmx2g'
alias cp='cp -p'

alias ls='ls -t --color=auto'
alias more='less -M -R'
alias vi='vim -X'
alias readme='rst2html.py README.rst > README.html'
alias dos2unix='col -b <'
alias ba='vi ~/.bashrc && source ~/.bashrc'
alias va='vi ~/.vimrc'
alias ch='chmod u+x'
alias ftp='ftp -i'
alias ac='aclocal && autoconf && touch NEWS README AUTHORS ChangeLog && automake --add-missing'
alias astyle='astyle --style=ansi --convert-tabs'
alias grep='grep --color'
IGV=/usr/local/projects/MTG4/htang/export/IGV_2.0.10
alias igv='java -Xmx3g -Djava.library.path=${IGV} -jar ${IGV}/igv.jar'
#alias seqret='java -jar ~/bin/readseq.jar'

export PRINTER=p5f2d
export PHRED_PARAMETER_FILE=/usr/local/genome/lib/phredpar.dat
export HAXE_LIBRARY_PATH=$HOME/lib/haxe/std:.
export ACEDB_MACHINE=LINUX_GTK2_4
export INPUTRC=$HOME/.inputrc

# use ANNOTATION_ENV
export ANNOTATION_DIR=/usr/local/annotation

# use EGC
export ANNOT_DEVEL=/usr/local/devel/ANNOTATION
export EGC_SCRIPTS=${ANNOT_DEVEL}/euk_genome_control/bin
export EGC_UTILITIES=${ANNOT_DEVEL}/EGC_utilities/bin
export EUK_MODULES=${ANNOT_DEVEL}/Euk_modules/bin
export EVM=$ANNOT_DEVEL/EVidenceModeler
export TRINITY_HOME=~/htang/export/trinityrnaseq_r2013-02-25/
export CEGMA=~/htang/export/cegma_v2.4.010312
export WISECONFIGDIR=/local/mtg4/htang/export/cegma_v2.4.010312/wise2.2.3-rc7/wisecfg/

# Compiler
LD_LIBRARY_PATH=${PACKAGES}/gcc-4.7.1/lib64/:/usr/lib64:${PACKAGES}/python/lib/:$LD_LIBRARY_PATH:$HOME/lib:$HOME/lib64/R:$SCRATCH/lib
export LD_LIBRARY_PATH
LD_RUN_PATH=$SCRATCH/lib
export LD_RUN_PATH

#export CFLAGS=-I$HOME/include
#export CPPFLAGS=$CFLAGS
#export PKG_CONFIG_PATH=$SCRATCH/lib/pkgconfig
#export LDFLAGS="-L$SCRATCH/lib -lm"
export CLASSPATH=$CLASSPATH:$HOME/lib/biojava.jar:$HOME/lib/libreadline-java.jar:$HOME/lib/sam-1.32.jar

export PERL5LIB=$HOME/lib/perl5:$SCRATCH/lib:$HOME/bin:/usr/local/devel/ANNOTATION/ard/ergatis-v2r13b2/libv2r10b1/perl5/
export EDITOR='/usr/bin/vim -X'

# JKsrc dependency
MYSQLLIBS=`mysql_config --libs`
export MYSQLLIBS
export MYSQLINC=/usr/include/mysql

# scipy dependency
export ATLAS=$HOME/lib
export BLAS=$HOME/lib

export TMOUT=0
export DISPLAY=$REMOTEHOST:0.0
export GAP=$HOME/code/google_appengine

# Import Sybase settings
export SYBASE=/usr/local/packages/sybase
export LD_LIBRARY_PATH=/usr/local/packages/sybase/lib:$LD_LIBRARY_PATH
export SHLIB_PATH=/usr/local/packages/sybase/lib:$SHLIB_PATH

# OPENMP thread number
export OMP_NUM_THREADS=64

# Ruby gem install
export GEM_HOME=$HOME/lib

# Remote logins
alias qj='qjobstats -usage -timeline -owner htang > results.html'
alias jcvica='ssh -l jcvica aafc-aac.usask.ca'
alias coge='ssh -l tanghaibao coge.iplantc.org -p 1657 -XYC'
alias geco='ssh -l tanghaibao geco.iplantc.org -p 1657'
alias haroun='ssh -l tanghaibao haroun.iplantc.org -p 1657 -XYC'
alias ranger='ssh -l htang ranger.tacc.teragrid.org -XYC'
alias lonestar='ssh -l htang lonestar.tacc.teragrid.org -XYC'
alias jupiter='ssh -l vkrishna jupiter.lmcg.wisc.edu -XYC'
alias chibba='ssh -l bao chibba.agtec.uga.edu -XYC'
alias biocon='ssh -l bao biocon.berkeley.edu -XYC'
alias rcluster='ssh -l bao rcluster.rcc.uga.edu -XYC'
alias toxic='ssh -l bao toxic.berkeley.edu -XYC'
alias synteny='ssh -l bao synteny.cnr.berkeley.edu -XYC'
alias syntelog='ssh -l bao syntelog.com -XYC'
alias homer='ssh -l bao homer.cnr.berkeley.edu -XYC'
alias towson='ssh -l jcvi biodatabases.towson.edu -XYC'
alias papaya='ssh minglab@ming256.life.uiuc.edu -XYC'

# Network
alias apache='sudo /opt/apache2/bin/apachectl'
alias ns='netstat -antuwp | grep "^tcp.*LISTEN"'
alias arr="echo 'restarting apache'; apache restart"
alias mpmake='CC=/usr/local/packages/gcc-4.4.3/bin/g++ CXX=/usr/local/packages/gcc-4.4.3/bin/g++ make'

umask 002
# make linux sort correctly
export LC_ALL="C"
source ${HOME}/.i-commands-auto.bash

SEYMOUR_HOME=/usr/local/devel/BCIS/PacBioSoftware/smrtanalysis-1.4.0/
export SEYMOUR_HOME
JELLYPATH=/usr/local/projects/MTG4/PacBio/PBJelly_12.9.14/
export JELLYPATH
#source $JELLYPATH/exportPaths.sh
