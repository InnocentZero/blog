.DEFAULT_GOAL := git
m ?= Based commit
git:
	flatpak run org.getzola.zola build
	git add -A
	git commit -m "$m"
	git push origin main

