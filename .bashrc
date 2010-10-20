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
alias dd="cd ${HOME}/projects/brassica/"
alias damon='cd ${HOME}/projects/damon/domesticated_mules'

#eval `dircolors ~/.dir_colors`
alias ls='ls -t --color=auto'
alias more='less'
alias du='du -sh *'
alias mongod='mongod -dbpath ~/db/mongod/'
alias easy_install='easy_install -UZ --prefix=$HOME'
alias easy_uninstall='easy_install -mxN'
alias configure='configure --prefix=$HOME'
alias vi='vim -X'
alias readme='rst2html.py README.rst >README.html'
alias dos2unix='col -bx <'
alias ps='ps -U bao'
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

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export MACHTYPE=i486
export PHRED_PARAMETER_FILE=/usr/local/genome/lib/phredpar.dat
export CROSS_MATCH_VECTOR=${HOME}/data/vectors/vector.seq
export PATH=$PATH:.:/usr/local/blast/bin:/usr/local/blast/data:/usr/local/genome/bin:${HOME}/bin/${MACHTYPE}:${HOME}/bin:${HOME}/software:${HOME}/bin/java/jdk1.6.0_13/bin:${HOME}/scripts
export HAXE_LIBRARY_PATH=${HOME}/lib/haxe/std:.
export PYTHONPATH=${HOME}/lib/python2.6/site-packages/:.
export WISECONFIGDIR=${HOME}/software/wise2.2.0/wisecfg
export MAGICK_HOME=${HOME}
export HDF5_DIR=${HOME}
export ACEDB_MACHINE=LINUX_GTK2_4
export INPUTRC=${HOME}/.inputrc
export JYTHON_HOME=${HOME}/lib/jython2.5.2b1/

# Compiler specific
export LD_LIBRARY_PATH=${HOME}/lib
export CFLAGS=-I${HOME}/include
export CPPFLAGS=${CFLAGS}
export LDFLAGS="-L${LD_LIBRARY_PATH} -lm"
export PKG_CONFIG_PATH=${HOME}/lib/pkgconfig
export CLASSPATH=$CLASSPATH:${HOME}/lib/weka.jar:${HOME}/lib/weka/mysql-connector-java-5.1.6-bin.jar:${HOME}/lib/biojava.jar:${HOME}/lib/libreadline-java.jar

# JKsrc dependency
export MYSQLLIBS=`mysql_config --libs`
export MYSQLINC=/usr/include/mysql

export TMOUT=0
#export DISPLAY=${REMOTEHOST}:0.0
export PATH=${PATH}:~/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin/bio:/usr/X11R6/bin:~/perl:.:/sbin:/usr/sbin
export GAP=${HOME}/code/google_appengine

alias ns='netstat -antuwp | grep "^tcp.*LISTEN"'
alias chibba='ssh chibba.agtec.uga.edu -XYC'
alias new='ssh 169.229.192.214 -XYC'
alias biocon='ssh biocon.berkeley.edu -XYC'
alias rcluster='ssh rcluster.rcc.uga.edu -XYC'
alias toxic='ssh toxic.berkeley.edu -XYC'
alias synteny='ssh synteny.cnr.berkeley.edu -XYC'
alias synlog='ssh syntelog.com -XYC'
alias homer='ssh homer.cnr.berkeley.edu -XYC'
alias perlib='cd /usr/lib/perl5/site_perl'
alias mydb='cd /usr/lib/perl5/site_perl/CNS/MyDB'
alias coge='cd /opt/apache/CoGe'
alias seqret='java -jar ~/bin/readseq.jar'
alias gobe="cd ${HOME}/public_html/gobe"
alias apache='sudo /opt/apache2/bin/apachectl'
alias makeperl='perl Makefile.PL lib=/usr/lib/perl5/site_perl'
alias mpmi='makeperl; make install'
alias mpmix='perl Makefile.PL; make install'
alias xt="(xterm ;)& (xterm ;)& (xterm ;)&"
alias kdx="kd; xt"
alias arr="echo 'restarting apache'; apache restart"
alias mysql="mysql -h biocon"
alog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }
blog () { command tail -f /opt/apache/logs/`date "+%Y/%m/%d"`/access.log ; }
aless () { command less /opt/apache/logs/`date "+%Y/%m/%d"`/errors.log ; }
export PERL5LIB='/usr/lib/perl5/site_perl'

export EDITOR='/usr/bin/vim -X'

