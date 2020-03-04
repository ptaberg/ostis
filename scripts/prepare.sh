#!/bin/bash

red="\e[1;31m"  # Red B
blue="\e[1;34m" # Blue B
green="\e[0;32m"

bwhite="\e[47m" # white background

rst="\e[0m"     # Text reset

st=1

stage()
{
    echo -en "$green[$st] "$blue"$1...$rst\n"
    let "st += 1"
}

clone_project()
{
    if [ ! -d "../$2" ]; then
        echo -en $green"Clone $2$rst\n"
        git clone $1 ../$2
        cd ../$2
        git checkout $3
        cd -
    else
        echo -en "You can update "$green"$2"$rst" manualy$rst\n"
    fi
}

stage "Clone projects"

clone_project https://github.com/ptaberg/sc-machine.git sc-machine scp_stable
clone_project https://github.com/Ivan-Zhukau/sc-web.git sc-web master
clone_project https://github.com/ShunkevichDV/ims.ostis.kb.git ims.ostis.kb master

stage "Prepare projects"

prepare()
{
    echo -en $green$1$rst"\n"
}

prepare "sc-machine"

cd ../sc-machine/scripts
python3Version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
sed -i -e "s/python3.5-dev/python$python3Version-dev/" ./install_deps_ubuntu.sh
sed -i -e "s/python3.5-dev/python$python3Version/" ./install_deps_ubuntu.sh
./install_deps_ubuntu.sh

apt-get install -y redis-server

./clean_all.sh
./make_all.sh
cd -

prepare "sc-web"
pip install --default-timeout=100 future
apt-get install -y python-dev # required for numpy module
apt-get install -y python-setuptools

cd ../sc-web/scripts

./install_deps_ubuntu.sh
./install_nodejs_dependence.sh

cd -
cd ../sc-web
npm installc
grunt build
cd -
echo -en $green"Copy server.conf"$rst"\n"
cp -f ../config/server.conf ../sc-web/server/

stage "Build knowledge base"

./build_kb.sh
