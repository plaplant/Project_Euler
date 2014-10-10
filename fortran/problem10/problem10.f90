program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: max_int = 1999999

  ! Variables
  integer(8) :: i,sum

  ! Do work
  sum = 0
  do i=2,max_int
     if (is_prime(i)) then
        sum = sum + i
     endif
  enddo

  ! Write out result
  write(*,*) "Sum of primes less than ",max_int,": ",sum


contains


  pure function is_prime(targ)
    ! Default
    implicit none

    ! Function arguments
    integer(8), intent(in) :: targ
    logical                :: is_prime

    ! Local variables
    integer(8) :: i,max_try

    ! Find the max we should try
    max_try = int(sqrt(1D0*targ))

    do i=2,max_try
       if (mod(targ,i)==0) then
          is_prime = .false.
          return
       endif
    enddo

    is_prime = .true.
    return
  end function is_prime


end program main
