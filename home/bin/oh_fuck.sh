#!/bin/bash
git tag temp$RANDOM
git reset --hard HEAD^
git push --force
echo "There. I fixed your stupid mistake Tyrel"
