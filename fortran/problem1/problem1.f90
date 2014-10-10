program main
  ! Default
  implicit none

  ! Variables
  integer(4) :: i,sum

  ! Do work
  sum = 0
  do i=1,999
     if (mod(i,3)==0 .or. mod(i,5)==0) then
        sum = sum + i
     endif
  enddo

  ! Write out result
  write(*,*) 'Sum: ',sum
end program main
