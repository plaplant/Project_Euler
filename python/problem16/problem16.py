#!/usr/bin/env python
from __future__ import print_function

nletters = 0
for i in range(1, 1000):
    # make a copy
    j = i
    nl = 0
    istr = str(i)
    if j >= 100:
        if int(istr[0]) == 1:
            nl += 3  # "one"
        elif int(istr[0]) == 2:
            nl += 3  # "two"
        elif int(istr[0]) == 3:
            nl += 5  # "three"
        elif int(istr[0]) == 4:
            nl += 4  # "four"
        elif int(istr[0]) == 5:
            nl += 4  # "five"
        elif int(istr[0]) == 6:
            nl += 3  # "six"
        elif int(istr[0]) == 7:
            nl += 5  # "seven"
        elif int(istr[0]) == 8:
            nl += 5  # "eight"
        else:
            nl += 4  # "nine"
        # add "hundred"
        nl += 7
        if j % 100 != 0:
            # add "and"
            nl += 3

        # re-cast to just 2 digits
        j = int(istr[1:])
        istr = str(j)
    if j >= 20:
        # step through the digits
        # tens place
        if int(istr[0]) == 2:
            nl += 6  # "twenty"
        elif int(istr[0]) == 3:
            nl += 6  # "thirty"
        elif int(istr[0]) == 4:
            nl += 5  # "forty"
        elif int(istr[0]) == 5:
            nl += 5  # "fifty"
        elif int(istr[0]) == 6:
            nl += 5  # "sixty"
        elif int(istr[0]) == 7:
            nl += 7  # "seventy"
        elif int(istr[0]) == 8:
            nl += 6  # "eighty"
        else:
            nl += 6  # "ninety"

        # ones place
        if int(istr[1]) == 0:
            pass
        elif int(istr[1]) == 1:
            nl += 3  # "one"
        elif int(istr[1]) == 2:
            nl += 3  # "two"
        elif int(istr[1]) == 3:
            nl += 5  # "three"
        elif int(istr[1]) == 4:
            nl += 4  # "four"
        elif int(istr[1]) == 5:
            nl += 4  # "five"
        elif int(istr[1]) == 6:
            nl += 3  # "six"
        elif int(istr[1]) == 7:
            nl += 5  # "seven"
        elif int(istr[1]) == 8:
            nl += 5  # "eight"
        else:
            nl += 4  # "nine"
    else:
        # handle these numbers as special cases
        if j == 1:
            nl += 3  # "one"
        elif j == 2:
            nl += 3  # "two"
        elif j==3:
            nl += 5  # "three"
        elif j == 4:
            nl += 4  # "four"
        elif j == 5:
            nl += 4  # "five"
        elif j == 6:
            nl += 3  # "six"
        elif j == 7:
            nl += 5  # "seven"
        elif j == 8:
            nl += 5  # "eight"
        elif j == 9:
            nl += 4  # "nine"
        elif j == 10:
            nl += 3  # "ten"
        elif j == 11:
            nl += 6  # "eleven"
        elif j == 12:
            nl += 6  # "twelve"
        elif j == 13:
            nl += 8  # "thirteen"
        elif j == 14:
            nl += 8  # "fourteen"
        elif j == 15:
            nl += 7  # "fifteen"
        elif j == 16:
            nl += 7  # "sixteen"
        elif j == 17:
            nl += 9  # "seventeen"
        elif j == 18:
            nl += 8  # "eighteen"
        elif j == 19:
            nl += 8  # "nineteen"
        else:
            # special case: an even hundred
            pass

    # add to running total
    nletters += nl

# add "one thousand" separately
nletters += 11

# write out the answer
print("total number of letters: ", nletters)
