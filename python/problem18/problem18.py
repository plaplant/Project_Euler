#!/usr/bin/env python

from __future__ import print_function, division, absolute_import
import numpy as np

triangle_fn = "triangle.txt"
triangle = np.genfromtxt(triangle_fn)
nrows = triangle.shape[0]

for i in list(range(nrows - 1))[::-1]:
    for j in range(i + 1):
        s1 = triangle[i + 1, j]
        s2 = triangle[i + 1, j + 1]
        triangle[i, j] += max(s1, s2)

print("Max sum: ", triangle[0, 0])
