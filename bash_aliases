export HOMEBREW_GITHUB_API_TOKEN="caf4cd85c6eb6ddcf006d4571d4a294c0b0592e4"
alias ag='\ag --pager="less"'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias g='git'
alias pdb="python -m pdb"
alias ppjson="python -m json.tool"

# Addgene specific
alias adocs='cd $ADDGENE_CORE_REPO_DIR/docs && make html && open $ADDGENE_CORE_REPO_DIR/docs/build/html/index.html'
alias deploy_all="fab -R silver-web deploy:master &&  fab -R gold-web deploy:master && fab -R jupyter fab -R jupyter deploy_jupyter && fab --parallel avail_staging_hosts deploy:master"
alias deploy_all_migration="fab -R silver-web deploy:master,1 &&  fab -R gold-web deploy:master,1 && fab -R jupyter deploy_jupyter & fab --parallel avail_staging_hosts deploy:master,1"
alias aenv='env | sort | grep ADDGENE'
alias sl='source local.env'
unalias mysql

if [[ $OSTYPE == darwin* ]]; then
    alias rm=trash;
fi;
