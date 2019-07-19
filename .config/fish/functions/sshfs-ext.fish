# Defined in - @ line 1
function sshfs-ext --description 'alias sshfs-ext=sshfs probst@192.168.0.14:/run/media/probst/Externo/ /home/probst/ayanami'
	sshfs probst@192.168.0.14:/run/media/probst/Externo/ /home/probst/ayanami $argv;
end
