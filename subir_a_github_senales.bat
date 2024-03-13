 cp -r milibro/* senales_sistemas
cd senales_sistemas
git add ./*
git commit -m "Subiendo a GitHub"
git push
ghp-import -n -p -f _build/html
cd ..