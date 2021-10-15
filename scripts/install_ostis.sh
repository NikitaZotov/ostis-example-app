#!/bin/bash

PLATFORM_REPO="https://github.com/ostis-dev/ostis-web-platform.git"
PLATFORM_FOLDER="ostis-web-platform"

error()
{
   echo "$1 was incorrectly installed";
   exit 1;
}

prepare_platform()
{
	cd scripts || error "OSTIS-web-platform"
	sudo apt-get update
	./prepare.sh
	cd ..
}

include_kb()
{
	rm ./ims.ostis.kb/ui/ui_start_sc_element.scs
	rm -rf ./kb/menu
	{
	  echo "../kb"
	  echo "../problem-solver"
	  echo "../interface"
	} >> ./repo.path
	cd scripts || error "OSTIS-web-platform"}
	./build_kb.sh
	cd ..
}

include_kpm()
{
	cd sc-machine || error "SC-machine"
	echo "add_subdirectory(${SC_MACHINE_ROOT}/../../problem-solver/cxx ${SC_MACHINE_ROOT}/build/problem-solver)" >> ./CMakeLists.txt
	cd scripts || error "SC-machine"
	./make_all.sh
	cd ../..
}

include_interface()
{
	cd ../interface/sc-web-extensions || error "OSTIS-interface"
	npm install
	grunt build
	cd ../..
}

cd ..
if [ -d ${PLATFORM_FOLDER} ]; 
then
    echo -en "Update OSTIS platform\n"
    cd ${PLATFORM_FOLDER} || error "OSTIS-web-platform"
    git pull
    prepare_platform
else
    echo -en "Install OSTIS platform\n"
    git clone ${PLATFORM_REPO}
    cd ${PLATFORM_FOLDER} || error "OSTIS-web-platform"
    git checkout 0.5.0
    prepare_platform
    include_kb
    include_kpm
    include_interface
fi

