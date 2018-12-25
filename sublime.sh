#!/bin/bash
SUDO_USER=who | awk '{print $1}'
LICENSE_FILE=`pwd`/sublime.license
PACKAGE_LIST=`pwd`/sublime.package
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
#apt install apt-transport-https
#echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
#apt update && apt install sublime-text
pushd `pwd`
cp $LICENSE_FILE /home/$SUDO_USER/.config/sublime-text-3/Local/License.sublime_license
cp $LICENSE_FILE ~/.config/sublime-text-3/Local/License.sublime_license

cd /home/$SUDO_USER/.config/sublime-text-3/Installed\ Packages
wget https://packagecontrol.io/Package%20Control.sublime-package

cd /home/$SUDO_USER/.config/sublime-text-3/Packages/User
wget https://github.com/rudolfb/ubuntu-elixir-elm-install-shell-script/raw/master/sublime-text-3/Package%20Control.sublime-settings
wget https://github.com/rudolfb/ubuntu-elixir-elm-install-shell-script/raw/master/sublime-text-3/Terminal.sublime-settings
popd
