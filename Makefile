install:
	ln -s -f $(PWD)/emacs.el $(HOME)/.emacs
	echo "source $(PWD)/.profile" >> $(HOME)/.profile
