program main
  ! Use big int library
  use big_int_math

  ! Default
  implicit none

  ! Parameters
  character(*), parameter :: file_in = 'data.txt'


  ! Variables
  integer(4)     :: N_data,idata
  character(100) :: answer


  ! Arrays
  character(50), dimension(:), allocatable :: data


  ! Read in data
  call read_data


  ! Do work
  answer = add_two_big_nums(data(1),data(2))
  do idata=3,N_data
     answer = add_two_big_nums(data(idata),trim(answer))
  enddo


  ! Write out answer
  write(*,*) 'answer: ',trim(answer)
  write(*,*) 'first 10 digits: ',trim(answer(1:10))


contains


  subroutine read_data
    ! Default
    implicit none


    ! Local variables
    integer(4)    :: un,i
    character(50) :: temp


    ! Open file
    un = 11
    i  = 0
    open(un,file=file_in)
    do
       read(un,*,end=1) temp
       i = i + 1
    enddo
1   continue
    N_data = i

    ! Allocate array
    allocate(data(N_data))
    rewind(un)
    do i=1,N_data
       read(un,*) data(i)
    enddo
    close(un)


  end subroutine read_data
       

end program main
