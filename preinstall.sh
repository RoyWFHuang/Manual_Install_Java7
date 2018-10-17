#! /bin/bash

tar zxvf jdk-7u80-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm/
sudo cp jdk1.7.0_80 /usr/lib/jvm/java-7-openjdk-amd64 -rpaf
cd /usr/lib/jvm/
sudo ln -fs  java-7-openjdk-amd64 java-1.7.0-openjdk-amd64

priority=$(sudo update-alternatives --display java | grep priority | awk '{print $4}')
echo $priority

arr=(${priority// / });
length=${#arr[@]}
maxPriority=0
for(( j=0; j<$length; j++ ))
do
	line=${arr[$j]}
	if [ line>$maxPriority ]; then
		maxPriority=$line
	fi
	echo "max=$maxPriority"
done
priority="$(($maxPriority + 1))"

echo "priority=$priority"
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-1.7.0-openjdk-amd64/bin/java" $priority
sudo update-alternatives --auto java


cd /usr/local/bin/
sudo ln -sf /usr/bin/java java
sudo ln -sf /usr/lib/jvm/java-7-openjdk-amd64/bin/javah javah


