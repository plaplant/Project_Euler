program main
  implicit none
  integer(4), parameter :: N_max = 10000
  integer(4), dimension(N_max) :: amicables
  integer(4) :: i,ia,s1,s2

  ia = 1
  amicables = 0
  do i=2,N_max
     if (any(amicables==i)) then
        cycle
     endif
     ! get sum of divisors of this number
     s1 = sum_div(i)
     s2 = sum_div(s1)
     if (s2 == i .and. s1 /= i) then
        ! amicable numbers
        amicables(ia)   = i
        amicables(ia+1) = s1
        ia = ia + 2
     endif
  enddo

  write(*,*) "sum of amicables: ",sum(amicables)


contains


  pure function sum_div(n)
    ! Default
    implicit none

    ! Function arguments
    integer(4), intent(in) :: n
    integer(4)             :: sum_div

    ! Local variables
    integer(4) :: i1,i2,nmax

    ! Figure out max number to try
    nmax = int(sqrt(1D0*n))

    ! 1 is always a divisor
    sum_div = 1
    do i1=2,nmax
       if (mod(n,i1)==0) then
          ! work out if a perfect square
          i2 = n/i1
          if (i2 /= i1) then
             sum_div = sum_div + i1 + i2
          else
             sum_div = sum_div + i1
          endif
       endif
    enddo

    return
  end function sum_div


end program main
