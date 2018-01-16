# ------ ALIASES ------

# Alias hints for git
alias ghints="Pushing from one branch to another: 'git push origin source:target'"

# alias for editing file(s) file
alias bashrc="vim $HOME/.bashrc"
alias zshrc="vim $HOME/.zshrc"
alias bashalias="vim $HOME/.bash_aliases"
alias vimrc="vim $HOME/.vimrc"
alias ymc_global="vim $HOME/.vim/.ycm_extra_conf.py"
alias git_config="vim $HOME/.gitconfig"

alias vi=vim

# open ssl commands
alias cat_ssl_pub="openssl rsa -pubin -inform PEM -text -noout < "
alias cat_ssl_priv="openssl rsa -text -noout < "


alias exp_py2="export PATH=~/bin:$PATH"
alias bashrc_src="source $HOME/.bashrc"
alias zshrc_src="source $HOME/.zshrc"
alias start_lxdm="sysctlstart lxdm"

alias bobsearch="bob ls -rp | grep "

alias ie8="WINEARCH=win32 WINEPREFIX=~/.wine-ie8 wine ~/win32/drive_c/Program\ Files/Internet\ Explorer/iexplore.exe"

# alias for jumping to the C/C++ projects folder
alias goto_c="cd $HOME/C_Projects/"
alias goto_cpp="cd $HOME/CPP_Projects/"

# jump to the various locations
alias goto_home="cd $HOME/"
alias goto_mount="cd /mnt/"
alias goto_bobbuildtool="cd $HOME/BobBuildTool/"
alias goto_dl="cd $HOME/Downloads/"
alias goto_docs="cd $HOME/Documents/"
alias goto_shdrv="cd $HOME/shares/home/"
alias goto_glob_spec="cd $HOME/Global\ TEE\ Specification/"
alias goto_autosar="goto_docs; cd ./AutoSAR/40_Release4.0/01_Standard/"
alias goto_secboot="cd $HOME/SecBoot"

# alias for OP-TEE operations
alias goto_optee="cd $HOME/devel/optee/"
alias optee_build="exp_py2; goto_optee; cd build; make all run -j 4"

# alias to update, upgrade, search and install via apt-get
alias update="sudo pacman -Syu "
alias install="sudo pacman -S "
alias search="sudo pacman -Ss "
alias remove="sudo pacman -R "

# bash commands
alias tree="tree -C" 
alias ls="ls -l"
alias la="ls -la"
alias lr="ls -R"
alias lar="la -R"
alias lrgrep="lar | grep -r " 
alias lgrep="la | grep -i "
alias find_named="find . -name "
alias grephistory="history | grep -i "
alias grepprocesses="ps -aux | grep -i "
alias assasinate="kill -s KILL "
alias jobkill="kill -9 $(jobs -p)"
alias overkill="pkill -f "
alias tgrep="tree | grep -r"
alias lstree="tree -pugsh"

# alias to access libtomcrypt documentation
# alias libtomcrypt="okular /usr/share/doc/libtomcrypt-dev/crypt.pdf.gz"

# alias for systemctl commands
alias sysctlstat="sudo systemctl status "
alias sysctlstart="sudo systemctl start "
alias sysctlstop="sudo systemctl stop "
alias sysctlenable="sudo systemctl enable "
alias sysctldisable="sudo systemctl disable "

# run default QEMU if instance exists 
alias run_default_qemu="$HOME/devel/optee/build/../qemu/arm-softmmu/qemu-system-arm \
	-nographic \
	-serial tcp:localhost:54320 -serial tcp:localhost:54321 \
	-s -S -machine virt -machine secure=on -cpu cortex-a15 \
	-m 1057 \
	-bios $HOME/devel/optee/build/../out/bios-qemu/bios.bin \
	"

