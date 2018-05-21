#########################
# 	BASH ALIASES	#
#########################

# bash/settings files
alias bashrc="vim $HOME/.bashrc"
alias bashrc_src="source $HOME/.bashrc"
alias bashalias="vim $HOME/.bash_aliases"
alias vimrc="vim $HOME/.vimrc"

# Offsec related
alias offsec_ping="ping 10.11.xx.xx"
alias offsec_info="atom-dev /root/Kali\ PWK/Info"
alias offsec_mount="/usr/local/sbin/mount-shared-folders"
alias offsec_connect="offsec_info; openvpn /root/OS-xxxxx-PWK.ovpn "
alias offsec_win_remote="rdesktop -u xxxxx -p xxxxx 10.11.xx.xx"

# service shortcuts
alias ssh_start="service ssh start"
alias ssh_stop="service ssh stop"
alias ap2_start="service apache2 start"
alias ap2_stop="service apache2 stop"
alias tftp_start="atftpd --daemon --port 69 /tftp"
# given that the tftp runs as a daemon, it cannot be stopped as normal services
# instead it must be killed using the kill command (which requires a pid)
# therefore, first one must know the pid
alias tftp_pid="netstat -anup | grep atftpd | cut -d '/' -f1 | rev | cut -d ' ' -f1 | rev"
alias tftp_stop="kill -9 $(tftp_pid)"

# speedy copy aliases
alias cp_scripts="cp -R ~/scripts /mnt/hgfs/pwk_exercises_latex/"
alias cp_exploits="cp -R ~/exploits /mnt/hgfs/pwk_exercises_latex/"
alias cp_wireshark="cp -R ~/wireshark /mnt/hgfs/pwk_exercises_latex/"
alias cp_passwd="cp -R ~/passwd /mnt/hgfs/pwk_exercises_latex/"
alias cp_html="cp -R /var/www/html /mnt/hgfs/pwk_exercises_latex/exploits/"

# directory listings
alias ls="ls -l"
alias la="ls -a"
alias lar="ls -R"
alias lgrep="la | grep "
alias lrgrep="lar | grep "
alias tree="tree -C"
alias tgrep="tree | grep -r "
alias lstree="tree -pugsh"

# history and process search
alias grephistory="history | grep "
alias grepprocesses="ps -aux | grep "

# install, update, remove
alias install="sudo apt install "
alias update="sudo apt update"
alias upgrade="update; sudo apt upgrade"
alias autoremove="sudo apt autoremove"

# changing current directory
alias goto_dl="cd $HOME/Downloads"
alias goto_docs="cd $HOME/Documents"
alias goto_pics="cd $HOME/Pictures"
alias goto_mnt="cd /mnt"
alias goto_hgfs="goto_mnt; cd hgfs"
alias goto_pwe="goto_hgfs; cd pwk_exercises_latex"

# process and service kills
alias assasinate="kill -s KILL "
alias jobkill="kill -9 $(jobs -p)"
alias overkill="pkill -f "
alias find_named="find . -name "

