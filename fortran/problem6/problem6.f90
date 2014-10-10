program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: max_int = 100

  ! Variables
  integer(4) :: i,sum_sq,sq_sum,diff

  ! Do work
  sum_sq = 0
  sq_sum = 0
  do i=1,max_int
     sum_sq = sum_sq + i**2
     sq_sum = sq_sum + i
  enddo

  sq_sum = sq_sum**2
  diff   = sq_sum - sum_sq

  ! Write out answer
  write(*,*) 'Difference between sum of squares and square of sums up to ',&
       max_int,': ',diff

end program main
