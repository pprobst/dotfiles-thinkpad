# Defined in - @ line 1
function halt --description 'alias halt=systemctl halt'
	systemctl halt $argv;
end
