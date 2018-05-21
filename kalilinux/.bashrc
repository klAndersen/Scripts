# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[01;30m\]$(parse_git_branch) \[\033[01;34m\]$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable colors (taste the rainbow~)
force_color_prompt=yes


# prints the content of a (openSSL) PEM file
function print_pem_data() {
        ARGC=$#;
        print_byte=1;
        print_inf_byte=2;
        print_byte_in_c=3;
        if [ ! $ARGC -eq 2 ]; then
                echo "Expecting two arguments [ pem_file command_id ]";
                echo "Command ID:";
                echo -e "\t1: Print byte version";
                echo -e "\t2: Print informative byte version";
                echo -e "\t3: Print byte version in C-array format";
        else
                if [ $2 -eq $print_byte ]; then
                        cat $1 | sed 's/://g';
                elif [ $2 -eq $print_inf_byte ]; then
                        cat $1 |  sed 's/://g' | xxd -r -p | xxd ;
                elif [ $2 -eq $print_byte_in_c ]; then
                        cat $1 | sed 's/://g' |  xxd -r -p | xxd -i $1 ;
                else
                        echo "Expecting two arguments [ pem_file command_id ]";
                        echo "Command ID:";
                        echo -e "\t1: Print byte version";
                        echo -e "\t2: Print informative byte version";
                        echo -e "\t3: Print byte version in C-array format";

                fi
        fi
}

# Use the program 'pdfgrep' to search through (multiple) pdf(s) for content
pdf_search() {
        case "$#" in
                "1")
                        pdfgrep -in $1 *.pdf
                        ;;
                "2")
                        pdfgrep -$1 $2 *.pdf
                        ;;
                *)
                        echo "";
                        echo "---pdfsearch commands---";
                        echo "";
                        echo "For basic search, enter the search phrase.";
                        echo "Usage: pdf_search [search_phrase]";
                        echo "";
                        echo "For a defined search, enter options and search phrase.";
                        echo "Usage: pdf_search [options search_phrase]";
                        echo "";
                        echo "";
                        echo "---pdfgrep commands---";
                        echo "";
                        pdfgrep --help
                        ;;
        esac
}




