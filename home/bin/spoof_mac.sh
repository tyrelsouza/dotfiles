#!/bin/bash
sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')

