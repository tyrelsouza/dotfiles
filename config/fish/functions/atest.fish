function atest
	set a_test (echo $argv | sed -e 's/\//\./g' | sed -e 's/.py//g')
	set a_project (echo -n $a_test | python -c "import sys; print sys.stdin.read().split('.', 1)[0]");
    set run_test (echo "bin/manage_"$a_project".py test "$a_test)
    echo $run_test
    eval $run_test
end
