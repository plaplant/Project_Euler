def main():
    # Find the sum of numbers divisible by 3 or 5 up to 100
    max_int = 1000
    int_sum = 0
    for i in range(1,max_int):
        if i%3==0 or i%5==0:
            int_sum += i

    # Write out result
    print "Sum: ",int_sum

if __name__=='__main__':
    main()
