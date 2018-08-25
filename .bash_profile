source ~/.profile
# echo "  ___ _        _    _           __      __            _                    _  "
# echo " / __| |_  ___| |__| |___ _ _   \ \    / /__  ___  __| |_ __ ____ _ _ _ __| | "
# echo " \__ \ ' \/ -_) / _' / _ \ ' \   \ \/\/ / _ \/ _ \/ _' \ V  V / _' | '_/ _' | "
# echo " |___/_||_\___|_\__,_\___/_||_|   \_/\_/\___/\___/\__,_|\_/\_/\__,_|_| \__,_| "
# echo ""

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# prompt
export PS1="\[\033[38;5;9m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"  # timestamp
export PS1="$PS1\[\033[38;5;14m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]" # user/host
export PS1="$PS1\[\033[38;5;10m\]\w\[$(tput sgr0)\]"  # directory
export PS1="$PS1\[\033[38;5;11m\]\`parse_git_branch\` \[$(tput sgr0)\]"  # git branch
export PS1="$PS1> \[$(tput sgr0)\]"  # last char

# other colors
export CLICOLOR=1
export LSCOLORS=GxBxhxDxfxhxhxhxhxcxcx

#command aliases
alias ls="ls -1"
alias lsl="ls -lh"
alias dir="pwd"
alias bp="vim ~/.bash_profile"
alias cdc="cd /"
alias cdcd="cd -"
alias proj="cd ~/Developer/projects"
alias aswwu="cd ~/Developer/aswwu-web"
alias vault="cd /Volumes/Vault"
alias makevenv="python3 -m virtualenv .venv"
alias venv="source .venv*/bin/activate"
alias devenv="deactivate"
alias req="pip3 install -r requirements.txt"
alias reload="source ~/.bash_profile"
alias uploadtestpypi="twine upload --r testpypi dist/*"
alias uploadpypi="twine upload -r pypi dist/*"
alias prp="pipenv run python"
alias prpm="pipenv run python manage.py "

#cd shortcuts
alias cdaswwu="cd ~/Documents/ASWWU\ Web"

#script aliases
alias hidden="bash ~/Developer/scripts/bash/hidden.sh"

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		#STAT=`parse_git_dirty`
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}