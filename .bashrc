#
# ~/.bashrc
#

# enable colors (taste the rainbow~)
force_color_prompt=yes

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# exports
#export PATH=$HOME/BobBuildTool:$PATH
export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH
export PATH=$HOME/bin/:$PATH

# Trace32
export T32SYS=/opt/t32
export T32TMP=/tmp
export T32ID=T32
# executable path to the Trace32 
export PATH=$PATH:/opt/t32/bin/pc_linux64


# adds color to minicom
export MINICOM="-m -c on"
# show git directory
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# see https://superuser.com/a/610065
export PS1='\[\033[00;37m\][\[\033[00m\]\[\033[00;36m\]Lucas@\h \[\033[00m\]\[\033[00;32m\]\w\[\033[00m\]\[\033[00;33m\]$(__git_ps1)\[\033[00m\]\[\033[00;37m\]]\$ \[\033[00m\]'

# grep auto colouring
grep_options=(--colour=always)
alias grep='grep $grep_options'
# less_option=(-R)
alias less='less -R'

# include alias file if it exists
if [ -f $HOME/.bash_aliases ]; then
	. $HOME/.bash_aliases
fi


alias qt59="/opt/Qt5.9/Tools/QtCreator/bin/qtcreator &"

### FUNCTIONS ###

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
