# MacPorts Installer addition on 2009-06-23_at_12:22:45: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

#set textmate as default editor
export EDITOR="mate -w"
export VISUAL="mate -w"
export SVN_EDITOR="mate -w"

#only use these settings on my personal mac
if [ "$HOSTNAME" == "rds-macbook-pro.local" ]
then
	#pull in personal configuration
	. ~/Dropbox/github/profile/.personal_config
fi

#only use these settings on my corporate mac
if [ "$HOSTNAME" == "Rob-Shedds-PaddyPower-MacBook-Pro.local" ] || [ "$HOSTNAME" == "fangamb-mbp1.inhouse.paddypower.com" ]
then
	#pull in corporate configuration
	. ~/Dropbox/github/profile/.corporate_config
fi

#pull in servers
. ~/Dropbox/github/profile/.server_config

#export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:$PATH:/usr/local/bin:/Library/MySQL/bin #backup
export PATH=$HOME/bin:$PATH:/usr/local/bin:/Library/MySQL/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin
#needed to add port path AFTER main usr/bin paths to get proper loading order for environment variables

# Setup Amazon EC2 Command-Line Tools
if [ -f ~/.ec2 ]; then
	export EC2_HOME=~/.ec2
	export PATH=$PATH:$EC2_HOME/bin
	export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
	export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
	export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
fi

#setup bash completion for macports install
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
	
	if [ -f /opt/local/etc/bash_completion.d/git-completion.bash ]; then
		#Git-aware PS1--once you have the git-completion file, you can set your PS1 to display the current branch you are in.
		PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
	fi
fi

#check to see if brew command exists
if which brew &> /dev/null; then
	#setup bash completion for brew
	if [ -f `brew --prefix`/etc/bash_completion ]; then
	  	. `brew --prefix`/etc/bash_completion

		if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
			#Git-aware PS1--once you have the git-completion file, you can set your PS1 to display the current branch you are in.
			PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
		fi
	fi
fi

#setup rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
