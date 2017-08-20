program main
  ! Big int library
  use big_int_math

  ! Default
  implicit none

  ! Variables
  character(100) :: a,b,out

  ! Test big num lib
  a = '2147483647'
  b = '852516354'
  out = add_two_big_nums(a,b)

  write(*,*) 'a: ',a
  write(*,*) 'b: ',b
  write(*,*) 'a + b: ',out

end program main
