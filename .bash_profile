# .bash_profile

# Load .profile, containing login, non-bash related initializations.
if [ -f "$HOME/.profile" ] ; then
  source $HOME/.profile
fi
 
# Load .bashrc, containing non-login related bash initializations.
# Get the aliases and functions
if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi
