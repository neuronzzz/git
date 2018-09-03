#!/usr/bin/env bash

#参考文件： 
#https://www.atlassian.com/git/tutorials/merging-vs-rebasing
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

#创建topic分支，并构建相应的commit
git add a.txt
git commit -m "add a.txt"
git add b.txt
git commit -m "add b.txt"
git add c.txt
git commit -m "add c.txt"

#执行rebase，完成实验结果，rebase，相当于把当前branch或者指定的某个branch的基换成一个指定的branch
git rebase master #当前branch是topic
git rebase master topic #当前branch可以是任意branch

#最后执行merge，把topic branch merge到master，然后删除topic，下面这个是一个最好的例子：
#当前开发的branch是feature branch
git checkout feature
#创建一个新的基于feature的临时branch
git checkout -b temporary-branch
#把当前的临时feature branch rebase到master上
git rebase -i master
#切换到master，并merge临时的feature branch，然后可以删除临时的feature branch，这个时候，feature branch未受任何影响
# [Clean up the history]
git checkout master
git merge temporary-branch
