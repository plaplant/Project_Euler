program main
  ! Default
  implicit none

  ! Parameters
  integer(8) :: targ = 600851475143

  ! Variables
  integer(8) :: i,max_fac,max_try

  ! Determine maximum value we should try
  max_try = int(sqrt(1D0*targ))

  max_fac = 1
  do i=2,max_try
     ! Check that i is a factor of the number
     if (mod(targ,i)==0) then
        ! Now check to see if i is prime
        if (is_prime(i)) then
           max_fac = i
        endif
     endif
  enddo

  ! Write out answer
  write(*,*) "Max factor: ",max_fac

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
