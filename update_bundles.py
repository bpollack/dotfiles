#!/usr/bin/env python

import os
import subprocess
from os import path

BUNDLES = path.join(path.abspath(path.dirname(__file__)), 'vim', 'bundle')

for bundle in os.listdir(BUNDLES):
    os.chdir(path.join(BUNDLES, bundle))
    if path.exists('.hg'):
        subprocess.call(['hg', 'pull'])
        subprocess.call(['hg', 'update'])
    else:
        subprocess.call(['git', 'pull'])
