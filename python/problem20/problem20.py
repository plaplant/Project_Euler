#!/usr/bin/env python
from __future__ import print_function

def factorial(n):
    if n == 1:
        return n
    else:
        return n * factorial(n - 1)

f100 = factorial(100)
sf100 = str(f100)
s = 0
for n in sf100:
    s += int(n)

print("sum of digits: ", s)
