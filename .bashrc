#!/bin/bash
# important to carry out group permission settings... (bct 12/3/04)
umask 002

# User specific aliases and functions
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\](\w) \$ \[\033[00m\]'

shopt -s histappend
export PROMPT_COMMAND='history -a'

# These set up/down to do the history searching
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# active project
PROJ="/usr/local/projects"
ARCHIVE="/usr/local/archive/projects"
BOG="$PROJ/BOG"
MTG3="$PROJ/MTG3"
MTG4="$PROJ/MTG4"
SCRATCH="/local/scratch/htang"
alias bo="cd $BOG/htang"
alias mt="cd $MTG4/htang"
alias current="cd $MTG3/IMGAG3.5/PSEUDOMOLECULE_BUILD/CURRENT"
alias mtg3="cd $MTG3"
alias qsub='qsub -P 04048 -cwd'
alias qlogin='qlogin -P 04048'
alias sqsh='sqsh -S SYBPROD'
alias scratch="cd $SCRATCH"
alias samtools='$HOME/bin/samtools'
alias java='java-1.6.0 -Xmx2g'
alias cp='cp -p'

# Import CentOS grid settings
SGE=/usr/local/sge_current/jcvi/common/settings.sh
if [ -r "$SGE" ]; then . $SGE; else echo "Missing $SGE - contact sysadmin."; fi

# Import Sybase settings
export SYBASE=/usr/local/packages/sybase
export LD_LIBRARY_PATH=/usr/local/packages/sybase/lib:$LD_LIBRARY_PATH
export SHLIB_PATH=/usr/local/packages/sybase/lib:$SHLIB_PATH

alias grid='python -m jcvi.apps.grid'

alias ls='ls -t --color=auto'
alias more='less -M'
alias ddu='du -sh *'
alias mongod='mongod -dbpath ~/db/mongod/'
alias easy_install='easy_install -UZ --prefix=$HOME'
alias easy_uninstall='easy_install -mxN'
alias configure='configure --prefix=$SCRATCH'
alias vi='vim -X'
alias readme='rst2html.py README.rst >README.html'
alias dos2unix='col -bx <'
alias al='cd ~/projects/alignments'
alias ba='vi ~/.bashrc && bash'
alias va='vi ~/.vimrc'
alias qa='cd ~/projects/quota-alignment'
alias ch='chmod u+x'
alias ftp='ftp -i'
alias pysrc='cd ~/lib/python2.6/site-packages'
alias ac='aclocal && autoconf && touch NEWS README AUTHORS ChangeLog && automake --add-missing'
alias astyle='astyle --style=ansi --convert-tabs'
alias grep='grep --color'
alias jipython='jython /home/bao/lib/jython2.5.2b1/ipython-0.9.1/ipython.py'
alias igv='java -Xmx1000m -Djava.library.path=/export/lab/IGV_1.5.44/native/linux-64 -jar /export/lab/IGV_1.5.44/igv.jar'

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export PRINTER=p5f2d
export MACHTYPE=i486
export PHRED_PARAMETER_FILE=/usr/local/genome/lib/phredpar.dat
export CROSS_MATCH_VECTOR=${HOME}/data/vectors/vector.seq
PATH=.:${PATH}:/usr/local/projects/tgi/bin/:/usr/local/blast/bin:/usr/local/blast/data:/usr/local/genome/bin:${HOME}/bin/${MACHTYPE}:${HOME}/bin:${HOME}/software:${HOME}/bin/java/jdk1.6.0_13/bin:${HOME}/scripts:$SCRATCH/bin:/usr/local/common/:/usr/local/packages/clc-ngs-cell:/usr/local/packages/CA/bin/
export PATH
export HAXE_LIBRARY_PATH=${HOME}/lib/haxe/std:.
export PYTHONPATH=${HOME}/lib/python2.6/site-packages/:${HOME}/code/:.
export WISECONFIGDIR=${HOME}/software/wise2.2.0/wisecfg
export MAGICK_HOME=${HOME}
export HDF5_DIR=${HOME}/bin/hdf5
export ACEDB_MACHINE=LINUX_GTK2_4
export INPUTRC=${HOME}/.inputrc
export JYTHON_HOME=${HOME}/lib/jython2.5.2b1/

# Compiler specific
export LD_LIBRARY_PATH=${HOME}/lib:${HOME}/lib64/R:$SCRATCH/lib:$LD_LIBRARY_PATH
#export CFLAGS=-I${HOME}/include
export CPPFLAGS=${CFLAGS}
#export LDFLAGS="-L${LD_LIBRARY_PATH} -lm"
export PKG_CONFIG_PATH=${HOME}/lib/pkgconfig
export CLASSPATH=$CLASSPATH:${HOME}/lib/weka.jar:${HOME}/lib/weka/mysql-connector-java-5.1.6-bin.jar:${HOME}/lib/biojava.jar:${HOME}/lib/libreadline-java.jar

# JKsrc dependency
export MYSQLLIBS=`mysql_config --libs`
export MYSQLINC=/usr/include/mysql

# scipy dependency
export ATLAS=${HOME}/lib
export BLAS=${HOME}/lib

export TMOUT=0
#export DISPLAY=${REMOTEHOST}:0.0
export PATH=${PATH}:~/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin/bio:/usr/X11R6/bin:~/perl:.:/sbin:/usr/sbin
export GAP=${HOME}/code/google_appengine

alias ns='netstat -antuwp | grep "^tcp.*LISTEN"'
alias chibba='ssh -l bao chibba.agtec.uga.edu -XYC'
alias biocon='ssh -l bao biocon.berkeley.edu -XYC'
alias rcluster='ssh -l bao rcluster.rcc.uga.edu -XYC'
alias toxic='ssh -l bao toxic.berkeley.edu -XYC'
alias synteny='ssh -l bao synteny.cnr.berkeley.edu -XYC'
alias synlog='ssh -l bao syntelog.com -XYC'
alias homer='ssh -l bao homer.cnr.berkeley.edu -XYC'
alias perlib='cd /usr/lib/perl5/site_perl'
alias mydb='cd /usr/lib/perl5/site_perl/CNS/MyDB'
#alias seqret='java -jar ~/bin/readseq.jar'
alias gobe="cd ${HOME}/public_html/gobe"
alias apache='sudo /opt/apache2/bin/apachectl'
alias makeperl='perl Makefile.PL lib=/usr/lib/perl5/site_perl'
alias mpmi='makeperl; make install'
alias mpmix='perl Makefile.PL; make install'
alias xt="(xterm ;)& (xterm ;)& (xterm ;)&"
alias kdx="kd; xt"
alias arr="echo 'restarting apache'; apache restart"
alog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }
blog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/access.log ; }
aless () { command less /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }
export PERL5LIB=$HOME/lib/perl5

export EDITOR='/usr/bin/vim -X'

