# ------ ALIASES ------

# Alias hints for git
alias ghints="Pushing from one branch to another: 'git push origin source:target'"

# alias for editing file(s) file
alias bashrc='vim $HOME/.bashrc'
alias zshrc='vim $HOME/.zshrc'
alias bashalias='vim $HOME/.bash_aliases'
alias vimrc='vim $HOME/.vimrc'
alias ymc_global='vim $HOME/.vim/.ycm_extra_conf.py'
alias git_config='vim $HOME/.gitconfig'

alias vi=vim

# misc
alias android_dev="/opt/android-studio/bin/studio.sh &"
alias fmgr="dde-file-manager . &"

# open ssl commands
alias cat_ssl_pub='openssl rsa -pubin -inform PEM -text -noout < '
alias cat_ssl_priv='openssl rsa -text -noout < '

alias msfconsole="msfconsole --quiet -x \"db_connect hax0r@msf\""

alias exp_py2='export PATH=~/bin:$PATH'
alias bashrc_src='source $HOME/.bashrc'
alias zshrc_src='source $HOME/.zshrc'

alias ie8='WINEARCH=win32 WINEPREFIX=~/.wine-ie8 wine ~/win32/drive_c/Program\ Files/Internet\ Explorer/iexplore.exe'

# alias for jumping to the C/C++ projects folder
alias goto_c='cd $HOME/c_projects/'
alias goto_cpp='cd $HOME/cpp_projects/'
alias goto_python='cd $HOME/python_projects'

# jump to the various locations
alias goto_home='cd $HOME/'
alias goto_mount='cd /mnt/'
alias goto_dl='cd $HOME/Downloads/'
alias goto_docs='cd $HOME/Documents/'
alias goto_data='cd /media/Data'

# alias for OP-TEE operations
alias goto_optee='cd /media/Data/devel/optee/'
alias optee_build='exp_py2; goto_optee; cd build; make all run -j 4'

# alias to update, upgrade, search and install via apt-get
alias update='sudo pacman -Syu '
alias install='sudo pacman -S '
alias search='sudo pacman -Ss '
alias remove='sudo pacman -R '

# bash commands
alias tree='tree -C' 
alias ls='ls -l'
alias la='ls -la'
alias lr='ls -R'
alias lar='la -R'
alias lrgrep='lar | grep -r ' 
alias lgrep='la | grep -i '
alias find_named='find . -name '
alias grephistory='history | grep -i '
alias grepprocesses='ps -aux | grep -i '
alias assasinate='kill -s KILL '
alias jobkill='kill -9 $(jobs -p)'
alias overkill='pkill -f '
alias tgrep='tree | grep -r'
alias lstree='tree -pugsh'
alias lnames='find ./  -printf "%f\n"'

# alias for systemctl commands
alias sysctlstat='sudo systemctl status '
alias sysctlstart='sudo systemctl start '
alias sysctlstop='sudo systemctl stop '
alias sysctlenable='sudo systemctl enable '
alias sysctldisable='sudo systemctl disable '

# run default QEMU if instance exists 
alias run_default_qemu="$HOME/devel/optee/build/../qemu/arm-softmmu/qemu-system-arm \
	-nographic \
	-serial tcp:localhost:54320 -serial tcp:localhost:54321 \
	-s -S -machine virt -machine secure=on -cpu cortex-a15 \
	-m 1057 \
	-bios $HOME/devel/optee/build/../out/bios-qemu/bios.bin \
	"

