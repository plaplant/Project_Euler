program main
  ! Default
  implicit none

  integer(4), parameter :: grid_size = 20
  integer(8) :: nvalid

  ! compute combinatorics
  nvalid = two_n_choose_n(grid_size)
  write(*,*) "number of valid paths: ",nvalid


contains


  pure function two_n_choose_n(n)
    ! Default
    implicit none

    ! Function arguments
    integer(4), intent(in) :: n
    integer(8)             :: two_n_choose_n

    ! Local variables
    integer(4) :: i

    two_n_choose_n = 1
    do i=1,n
       two_n_choose_n = two_n_choose_n * (n+i)/i
    enddo

    return
  end function two_n_choose_n


end program main
