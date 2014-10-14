program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: target_num_div = 500

  ! Variables
  integer(8) :: i,tri_num,num_div

  ! Do work
  i       = 1
  tri_num = 0
  do
     tri_num = tri_num + i
     num_div = number_of_divisors(tri_num)

     if (num_div > target_num_div) then
        exit
     else
        i = i + 1
     endif
  enddo

  ! Write out answer
  write(*,*) "Smallest triangle number with more than ",target_num_div,&
       "divisors: ",tri_num

contains

  pure function number_of_divisors(i)
    ! Default
    implicit none

    ! Function arguments
    integer(8), intent(in) :: i
    integer(4)             :: number_of_divisors

    ! Local variables
    integer(8) :: max_try,test


    ! Find max factor to try
    max_try = nint(sqrt(1D0*i))

    ! We know that 1 and the number are trivial factors
    ! Protect against the case where i==1
    ! Since we start the checks below at n==2, the case of i==2
    !   is another special case we need to deal with properly
    if (i==1) then
       number_of_divisors = 1
       return
    else if (i==2) then
       number_of_divisors = 2
       return
    else
       number_of_divisors = 2
    endif

    ! Check to see if a number is a divisor
    ! We are testing from 2 to sqrt(i)
    ! For each number we find, we know there is going to be a pair of factors
    ! E.g.: for the case of i=36, we test from 2 to 6
    !   mod(36,2)==0 (so we've found 2 factors: 2 and 18)
    !   mod(36,3)==0 (another 2 factors: 3 and 12)
    !   mod(36,4)==0 (4 and 9)
    !   mod(36,5)/=0 (no factors)
    !   mod(36,6)==0 (but! 36/6==6, so we have caught the perfect-square case)
    ! Add to this the trivial factors of 1 and 36, and we have found all
    !   9 factors, while only having to test up through sqrt(36)
    test = 2
    do
       if (mod(i,test)==0) then
          ! Test for perfect-square case
          ! This should also be the end of the line, so we exit just in case
          !   rounding for max_int has introduced rouding errors
          if (i/test==test) then
             number_of_divisors = number_of_divisors + 1
             return
          else
             number_of_divisors = number_of_divisors + 2
          endif
       endif

       test = test + 1
       if (test > max_try) exit
    enddo

    return
  end function number_of_divisors


end program main
