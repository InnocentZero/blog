.DEFAULT_GOAL := git
m ?= Based commit
git:
	rm -rf docs
	flatpak run org.getzola.zola build
	mv public docs
	git add -A
	git commit -m "$m"
	git push origin main

