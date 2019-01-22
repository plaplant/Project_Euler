#!/usr/bin/env python
from __future__ import print_function

fib = []
fib.append(1)
fib.append(1)
imax = 2
while True:
    fib.append(fib[imax-1] + fib[imax-2])
    imax += 1
    if len(str(fib[-1])) >= 1000:
        print("index: ", imax)
        break
