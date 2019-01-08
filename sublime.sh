#!/bin/bash
SUDO_USER=who | awk '{print $1}'
LICENSE_FILE=`pwd`/sublime.license
PACKAGE_CFG=`pwd`/sublime.package
TERMINAL_CFG=`pwd`/sublime.terminal
PREFERENCE=`pwd`/sublime.preferences

echo "staring sublime_text installation..."

pushd `pwd`

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update && apt install -y sublime-text

cp $LICENSE_FILE /home/$SUDO_USER/.config/sublime-text-3/Local/License.sublime_license
cp $LICENSE_FILE ~/.config/sublime-text-3/Local/License.sublime_license

cd /home/$SUDO_USER/.config/sublime-text-3/Installed\ Packages
wget https://packagecontrol.io/Package%20Control.sublime-package

cd /home/$SUDO_USER/.config/sublime-text-3/Packages/User
cp $PACKAGE_CFG Package\ Control.sublime-settings
cp $TERMINAL_CFG Terminal.sublime-settings
cp $PREFERENCE Preferences.sublime-settings

if [ -e "/usr/share/applications/sublime_text.desktop" ]
	then
		sed -i "s/gedit/sublime_text/g" /usr/share/applications/defaults.list
		echo "application/x-shellscript=sublime_text.desktop" >> /usr/share/applications/defaults.list
fi

cd /home/$SUDO_USER/.tools
git clone https://github.com/lyfeyaj/sublime-text-imfix.git
cd sublime-text-imfix && ./sublime-imfix

popd

echo "sublime_text installation is complete!"
