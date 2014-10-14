#!/usr/bin/env python2.7

def main():
    max_int = 4000000

    f1 = 1
    f2 = 2
    int_sum = 2
    while(f2 < max_int):
        f3 = f1 + f2
        f1 = f2
        f2 = f3
        if (f2%2==0):
            int_sum = int_sum + f2

    print "Sum: ",int_sum

if __name__=='__main__':
    main()
