function shutdown
	systemctl start poweroff.target $argv;
end
