# Defined in - @ line 1
function sshfs-hiro --description 'alias sshfs-hiro=sshfs probst@192.168.0.6:/run/media/probst/Hiro/ /home/probst/ayanami'
	sshfs probst@192.168.0.6:/run/media/probst/Hiro/ /home/probst/ayanami $argv;
end
