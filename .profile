# MacPorts Installer addition on 2009-06-23_at_12:22:45: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

alias mysqlstart='sudo port load mysql5-server'
alias mysqlstop='sudo port unload mysql5-server'
alias mysql='sudo mysql5'

#working around change to md5 bin
alias md5sum='md5 -r'

alias mongod='mongod --config /usr/local/mongodb/mongod.conf'

#aliases for passenger enterprise edition
alias rubye='/opt/ruby-enterprise/bin/ruby' 
alias geme='/opt/ruby-enterprise/bin/gem'

#export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:$PATH:/usr/local/bin:/Library/MySQL/bin #backup
export PATH=$HOME/bin:$PATH:/usr/local/bin:/Library/MySQL/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin
#needed to add port path AFTER main usr/bin paths to get proper loading order for environment variables

# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

#setup rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#pull in personal configuration
. ~/Dropbox/github/profile/.personal_config