# Git

## git 기본 사용법
```shell
git init
# 리포지토리 초기화. '.git'폴더 생성. 이 폴더에 현재 폴더와 관련된 관리 정보가 저장. working tree라고 부른다. 변경 내역 등 관리.

git status
# Status

git add 파일명
# Add

git commit -m '첫 커밋'
# Commit

git fetch branch-A
# fetching remote branches 
# used typically for Fetch and Merge instead of Pull

git log --pretty=short
# Short 1line logs

git log README.md
# Log for specfic directories or README.md

git log -p
# See changed logs for all or specific files/directories

git diff
# working tree, 스테이지 영역, 최신 커밋 사이 변경 확인

git diff HEAD
# Compare between the most rescent commits

git checkout -b 'feature-A'
# create and checkout

git merge --no--ff feature-A
# Mergwe feature-A branch with the current branch. options = commenting merge commits

git log --graph
# see branches in graphs

git reset --hard 커밋해시값
# Reverting back to HEAD, stage, working tree to specific commit

git reflog
# All logs from this repo.

git commit --amend
# Fixing the most recent commit message!

git commit -am "add+commit"
# add, commit all

> git rebase -i HEAD~2
pick 7a34294 Add feature-C
pick 6fsdfa2 Fix typo
# 현재 브랜치의 HEAD(최신 commit)를 포함한 두 개의 변경 내역과 관련된 내용 보여짐. 이 두개를 합쳐 한 커밋으로 뭉개버리고 싶다. fix typo가 부끄러우니까!

pick 7a34294 Add feature-C
fixup 6fsdfa2 Fix typo
# 뭉개고 싶은 커밋에 'fixup'으로 고쳐주고 저장. 

git remote add origin git@github.com:사용자명/저장소이름.git
# Remote add origin.

git push -u origin feature-D
# push to branch feature-D

git clone git@github....git
# cloning

git branch -a
# display all branches

```

### Commit Messages
- First Line: 변경 내용 한 줄 요약
- Second Line: 공백
- Third line and after: 변경과 관련 내용 상세 기록

