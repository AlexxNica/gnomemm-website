web_path = /home/groups/g/gt/gtkmm/htdocs/beta/

post-html: 
	scp $$SSH_OPT -r *.shtml *.css fragments images $$USER@shell.sourceforge.net:$(web_path) 

