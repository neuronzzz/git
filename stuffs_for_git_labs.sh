#!/usr/bin/env bash

#下面的脚本是用来做rebase的实验的，参考的资料是git rebase --help

#生成提交文件
echo git labs >> README.md
echo a >> a.txt
echo b >> b.txt
echo c >> c.txt
echo d >> d.txt
echo f >> f.txt
echo e >> e.txt
echo g >> g.txt

#实验1：
 Assume the following history exists and the current branch is "topic":

                     A---B---C topic
                    /
               D---E---F---G master

       From this point, the result of either of the following commands:

           git rebase master
           git rebase master topic

       would be:

                             A'--B'--C' topic
                            /
               D---E---F---G master
#构建测试分支，当前在master branch下
git add d.txt
git commit -m "add d.txt"
git add e.txt
git commit -m "add e.txt"
git add f.txt
git commit -m "add f.txt"
git add g.txt
git commit -m "add g.txt"
