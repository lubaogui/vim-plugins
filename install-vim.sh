#!/usr/bin/env bash

currentPath=$(pwd)
basePath=$(cd $(dirname $0) && pwd)
bundlePath=$basePath/vim/bundle
echo $basePath
echo $bundlePath

#if bundle directory does not exist, create it!
if [ ! -d $bundlePath ]; then
    mkdir -p $bundlePath
fi

echo "entering working path!"

plugins=$(find $bundlePath -maxdepth 1 -mindepth 1 -type d)

startTime=$(date +%s)
updateFlag=0

echo "$plugins"

if [ "$plugins" != "" ]; then

#如果已经有插件，则直接更新插件    
for plugin in $plugins ; do
    echo "update plugin  $plugin"
    cd $plugin && git pull
    lastModifiyTime=$(stat -x -t %s $plugin |grep Modify |awk '{print $2}')
    if [ $lastModifiyTime -gt $startTime ];then
        updateFlag=1
    fi
done

else
#插件目录为空，则从配置文件检出对应插件   
updateFlag=1
gitSourceList=$(awk '{print $1}' $basePath/gitsource.config)
cd $bundlePath
for gitSource in $gitSourceList;do
    git clone $gitSource
    echo "clone from "$gitSource"succeeded!"
done
fi
    
#如果发现目的地vim不是该程序安装的vim, 则覆盖之
if [ ! -f ~/.vim/vim.lock ];then
    echo "target vim is not my vim ,so i will change it!"
    updateFlag=1
fi

#如果发生过变更则覆盖原来的vim配置和插件目录
if [ $updateFlag -eq 1 ];then
echo "delete old vimrc and vimplugin! no backup"
rm -fr ~/.vimrc 
rm -fr ~/.vim

echo "copy files to home directory!"
cp -r $basePath/vim ~/.vim
cp -r $basePath/vimrc ~/.vimrc

echo "succeeded!"
echo "leaving working path!"

else 
    echo "none files updated! so, nothing changed!"
fi
cd $currentPath

