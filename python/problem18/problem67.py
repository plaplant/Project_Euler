#!/usr/bin/env python

from __future__ import print_function, division, absolute_import
import numpy as np

triangle_fn = "p067_triangle.txt"
with open(triangle_fn) as f:
    lines = f.readlines()
    nrows = len(lines)
    triangle = np.zeros((nrows, nrows), dtype=np.int)
    for i, line in enumerate(lines):
        vals = list(map(int, line.strip().split()))
        triangle[i, :i + 1] = vals

for i in list(range(nrows - 1))[::-1]:
    for j in range(i + 1):
        s1 = triangle[i + 1, j]
        s2 = triangle[i + 1, j + 1]
        triangle[i, j] += max(s1, s2)

print("Max sum: ", triangle[0, 0])
