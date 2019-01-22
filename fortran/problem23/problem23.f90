program main
  implicit none
  integer(4), parameter :: N_max = 28123
  integer(4) :: i,j,ia,s,n,Nabundants
  logical    :: writable
  integer(4), dimension(N_max) :: temp_abundants
  integer(4), dimension(:), allocatable :: abundants


  ! build list of abundant numbers
  ia = 1
  do i=1,N_max
     if (sum_div(i) > i) then
        temp_abundants(ia) = i
        ia = ia + 1
     endif
  enddo

  Nabundants = ia - 1
  write(*,*) "Nabundants: ",Nabundants
  allocate(abundants(Nabundants))
  abundants = temp_abundants(:Nabundants)

  ! test to see if a number can be written as the sum of two abundant numbers
  s = 0
  !$omp parallel do             &
  !$omp default(shared)         &
  !$omp private(i,j,n,writable) &
  !$omp reduction(+:s)
  do i=1,N_max
     writable = .false.
     do j=1,Nabundants
        n = i - abundants(j)
        if (any(abundants==n)) then
           ! we can write it as the sum of 2 abundants
           writable = .true.
           exit
        endif
     enddo
     if (.not. writable) then
        s = s + i
     endif
  enddo
  !$omp end parallel do

  write(*,*) "sum of all numbers which cannot be written as the sum of two abundant numbers: ",s


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
