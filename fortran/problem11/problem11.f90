program main
  ! Default
  implicit none

  ! Parameters
  integer(4),   parameter :: group_len = 4
  character(*), parameter :: data_file = 'data.txt'

  ! Variables
  integer(4) :: max_prod

  ! Arrays
  integer(4), dimension(20,20) :: array


  ! Read in data
  call read_data(array,data_file)

  ! Check sets of products
  call find_max_prod(array,max_prod)

  ! Write out result
  write(*,*) "Max product of lines of size ",group_len,": ",max_prod


contains


  subroutine read_data(array,data_file)
    ! Default
    implicit none

    ! Subroutine arguments
    integer(4), dimension(:,:), intent(out) :: array
    character(*),               intent(in)  :: data_file

    ! Local variables
    integer(4) :: i
    integer(4), dimension(2) :: arr_shape

    ! Find array size
    arr_shape = shape(array)

    ! Read in data
    open(11,file=data_file)
    do i=1,arr_shape(2)
       read(11,*) array(:,i)
    enddo
    close(11)

    return
  end subroutine read_data


  subroutine find_max_prod(array,max_prod)
    ! Default
    implicit none

    ! Subroutine arguments
    integer(4), dimension(:,:), intent(in)  :: array
    integer(4),                 intent(out) :: max_prod

    ! Local variables
    integer(4) :: i,j,prod,idx
    integer(4), dimension(2) :: arr_shape
    logical :: check_right,check_down,check_up

    ! Get array shape
    arr_shape = shape(array)
    max_prod  = 0

    ! Loop through array
    ! We only compute the product of numbers to the right, down, and diagonally
    !   down-right.
    ! For instance, the product(array(1:4,1)) == product(array(4:1:-1,1))
    ! We also loop over all initial positions, and determine which directions
    !   we can compute
    do j=1,arr_shape(2)
       if (j+group_len-1 > arr_shape(2)) then
          check_down = .false.
       else
          check_down = .true.
       endif

       if (j-group_len < 0) then
          check_up = .false.
       else
          check_up = .true.
       endif

       do i=1,arr_shape(1)
          if (i+group_len-1 > arr_shape(1)) then
             check_right = .false.
          else
             check_right = .true.
          endif

          ! Check 4 in a row
          if (check_right) then
             prod     = product(array(i:i+group_len-1,j))
             max_prod = max(prod,max_prod)
          endif

          ! Check 4 in a column
          if (check_down) then
             prod     = product(array(i,j:j+group_len-1))
             max_prod = max(prod,max_prod)
          endif

          ! Check 4 diagonally down-right
          if (check_right .and. check_down) then
             prod = 1
             do idx=0,group_len-1
                prod = prod*array(i+idx,j+idx)
             enddo
             max_prod = max(prod,max_prod)
          endif

          ! Check 4 diagonally up-right
          if (check_right .and. check_up) then
             prod = 1
             do idx=0,group_len-1
                prod = prod*array(i+idx,j-idx)
             enddo
             max_prod = max(prod,max_prod)
          endif
       enddo
    enddo

    return
  end subroutine find_max_prod


end program main
