cp ~/.vimrc .
echo 开始提交本目录
    git add -A
    git status 
    echo 输入本次提交说明...
    read input
if [ ! -n  "$input" ];then 
    echo 输入为空，退出   
    exit 0
else
    git commit -m "$input"
    git push origin master
    exit 0
fi
