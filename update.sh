osType="$(uname -m)"
clear

echo ""
echo ""
echo "YERBAS update script ...."
echo ""
read -t 0.9 -p "Detecting system "

if [ $osType == "x86_64" ]
        then
        echo "$osType system detected."
elif [ $osType == "aarch64" ]
        then
        echo "$osType system detected."
else
        echo "ERROR ERROR ERROR...."
        echo ""
        echo "Script ending, no matching OS found"
        end
fi

read -t 1.5 -p "Stopping Yerbas Damon "
echo ""
cd ~/yerbas-build
./yerbas-cli stop
cd ~


read -t 1.5 -p "Removing YerbasBuild folder "
echo ""
rm -r yerbas-build


read -t 1.5 -p "Fetching yerbas v3.1.3.19 Smoking Sloth "
if [ $osType == "x86_64" ]
        then
        wget https://github.com/The-Yerbas-Endeavor/yerbas/releases/download/v.3.1.3.19/yerbas-ubuntu20-v3.1.3.19.tar.gz
elif [ $osType == "aarch64" ]
        then
        wget https://github.com/The-Yerbas-Endeavor/yerbas/releases/download/v.3.1.3.19/yerbas-arm64-v3.1.3.19.tar.gz
fi

if [ $osType == "x86_64" ]
        then
mkdir yerbas-build
tar -xf yerbas-ubuntu20-v3.1.3.19.tar.gz -C ~/yerbas-build
        rm yerbas-ubuntu20-v3.1.3.19.tar.gz
elif [ $osType == "aarch64" ]
        then
        mkdir yerbas-build
		tar -xf yerbas-arm64-v3.1.3.19.tar.gz -C ~/yerbas-build
        rm yerbas-arm64-v3.1.3.19.tar.gz
fi

read -t 1.5 -p "Restarting Yerbas Daemon "
echo " "
cd ~/yerbas-build
./yerbasd
cd ~

read -t 2 -p "UPDATE COMPLETE"
echo " "
