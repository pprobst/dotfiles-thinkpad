# Defined in - @ line 1
function sshfs-sae --description 'alias sshfs-sae=sshfs probst@192.168.0.6:/run/media/probst/Sae/ /home/probst/ayanami'
	sshfs probst@192.168.0.6:/run/media/probst/Sae/ /home/probst/ayanami $argv;
end
