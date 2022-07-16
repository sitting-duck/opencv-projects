#rm -rf ./build_*
#rm -rf ./opencv*

clean_build=true
clean_install=true


if [[ ${clean_build} == 'true' ]]; then
    for d in build_*/ ; do
        echo "$d"
        rm -r $d
    done
fi

if [[ ${clean_install} == 'true' ]]; then
    for d in install_*/ ; do
        echo "$d"
        rm -r $d
    done
fi
