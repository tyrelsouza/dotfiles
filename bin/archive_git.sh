#!/bin/bash
git checkout $1
git tag archive/$1 $1
git push origin --tags
git checkout -
git branch -D $1
git push origin :$1
