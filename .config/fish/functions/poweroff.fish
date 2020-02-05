# Defined in - @ line 1
function poweroff --description 'alias poweroff=systemctl poweroff'
	systemctl poweroff $argv;
end
