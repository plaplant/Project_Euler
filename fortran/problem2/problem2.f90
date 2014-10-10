program main
  ! Default
  implicit none

  ! Parameters
  integer(4) :: imax = 4000000

  ! Variables
  integer(4) :: i,sum
  integer(4) :: f1,f2,f3

  ! Init
  ! Since we're skipping 2, we initialize our sum with 2
  f1  = 1
  f2  = 2
  sum = 2
  do
     f3 = f1 + f2
     f1 = f2
     f2 = f3
     if (mod(f2,2)==0) then
        sum = sum + f2
     endif
     if (f2 > imax) then
        exit
     endif
  enddo

  ! Print answer
  write(*,*) "Sum: ",sum

end program main
