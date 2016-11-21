alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function glate(){git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname) %(committerdate) %(authorname)' | sed 's/refs\/heads\///g';}
export HOMEBREW_GITHUB_API_TOKEN="caf4cd85c6eb6ddcf006d4571d4a294c0b0592e4"
alias ag='\ag --pager="less"'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias g='git'
alias pdb="python -m pdb"
alias ppjson="python -m json.tool"
alias rm=trash

# Addgene specific
alias adocs='cd $ADDGENE_CORE_REPO_DIR/docs && make html && open $ADDGENE_CORE_REPO_DIR/docs/build/html/index.html'
alias deploy_all="fab -R silver-web deploy:master &&  fab -R gold-web deploy:master && fab -R jupyter fab -R jupyter deploy_jupyter && fab --parallel avail_staging_hosts deploy:master"
alias deploy_all_migration="fab -R silver-web deploy:master,1 &&  fab -R gold-web deploy:master,1 && fab -R jupyter deploy_jupyter & fab --parallel avail_staging_hosts deploy:master,1"
