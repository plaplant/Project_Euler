program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: targ = 10001

  ! Variables
  integer(4) :: idx
  integer(8) :: i

  ! Do work
  idx = 0
  i   = 2
  do
     if (is_prime(i)) then
        idx = idx + 1
        if (idx==targ) exit
     endif
     i = i + 1
  enddo

  ! Write out answer
  write(*,*) "The prime with index ",targ,"is: ",i


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
