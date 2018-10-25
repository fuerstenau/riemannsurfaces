if [[ -e texlive/bin ]]; then
	echo "TeX-Live appears to be already installed"
else
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar -xzf install-tl-unx.tar.gz
	rm install-tl-unx.tar.gz
	perl install-tl-*/install-tl --profile tl_profile
fi

export PATH=./texlive/bin/x86_64-linux:$PATH

tlmgr option -- autobackup 0
tlmgr update --self --all
tlmgr install $(cat tl_packages)
