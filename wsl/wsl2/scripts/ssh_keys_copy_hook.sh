#!/usr/bin/env sh

chmod 600 ~/.ssh/id_rsa
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
