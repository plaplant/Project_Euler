#!/usr/bin/env python
from __future__ import print_function
import numpy as np

names_fn = "p022_names.txt"
with open(names_fn) as f:
    names = [name[1:-1] for name in f.readlines()[0].strip().split(",")]

def name_val(name):
    s = 0
    for char in name.upper():
        s += ord(char) - 64
    return s

names = sorted(names)
name_score = np.zeros_like(names, dtype=np.int)
for i, name in enumerate(names):
    name_score[i] = name_val(name) * (i + 1)

print("name score total: ", np.sum(name_score))
