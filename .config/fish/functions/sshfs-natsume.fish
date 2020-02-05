# Defined in - @ line 1
function sshfs-natsume --description 'alias sshfs-natsume=sshfs probst@192.168.0.6:/home/probst/Natsume/ /home/probst/ayanami'
	sshfs probst@192.168.0.6:/home/probst/Natsume/ /home/probst/ayanami $argv;
end
