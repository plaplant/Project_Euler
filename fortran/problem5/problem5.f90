program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: max_divisor = 20

  ! Variables
  integer(4) :: i

  ! Do work
  i = max_divisor + 1
  do
     if (is_divisible(i)) then
        exit
     else
        i = i + 1
     endif
  enddo

  ! Write out result
  write(*,*) "Smallest number divisible by all numbers less than ",max_divisor,&
       ": ",i


contains


  pure function is_divisible(targ)
    ! Default
    implicit none

    ! Function arguments
    integer(4), intent(in) :: targ
    logical                :: is_divisible

    ! Local variables
    integer(4) :: i

    ! Check if the number is divisible by all factors
    do i=2,max_divisor
       if (mod(targ,i)/=0) then
          is_divisible = .false.
          return
       endif
    enddo

    is_divisible = .true.
    return
  end function is_divisible


end program main
