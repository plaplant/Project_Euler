program main
  ! Variables
  integer(4) :: i,n,imax,nmax

  nmax = 0
  imax = 1
  do i=2,999999
     n = count_collatz(i)
     if (n > nmax) then
        nmax = n
        imax = i
     endif
  enddo

  ! Write out answer
  write(*,*) "Longest chain:   ",nmax
  write(*,*) "Starting number: ",imax


contains


  pure function count_collatz(n)
    ! Default
    implicit none

    ! Function arguments
    integer(4), intent(in) :: n
    integer(4)             :: count_collatz

    ! Local variables
    integer(4) :: nsteps
    integer(8) :: n1

    ! Compute length of collatz chain
    n1     = n
    nsteps = 0
    do while (n1 /= 1)
       if (mod(n1,2)==0) then
          n1 = n1/2
       else
          n1 = 3*n1+1
       endif
       nsteps = nsteps + 1
    enddo

    count_collatz = nsteps
    return
  end function count_collatz


end program main
