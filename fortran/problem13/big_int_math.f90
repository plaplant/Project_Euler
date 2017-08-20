module big_int_math
  ! Default
  implicit none

contains

  pure function add_two_big_nums(a,b)
    ! Default
    implicit none

    ! Local parameters
    integer(4), parameter :: i_max    = int(log10(1D0*huge(int(1,kind=4))/10))-1
    integer(4), parameter :: i_max_10 = 10**(i_max)

    ! Function arguments
    character(*), intent(in) :: a,b
    character(len=:), allocatable :: add_two_big_nums

    ! Local variables
    integer(4)     :: i,i1,i2,j,idx
    integer(4)     :: carry,N_words,temp
    integer(4)     :: a_size,b_size,o_size
    integer(4)     :: a_words,b_words,o_words
    logical        :: include_pad
    character(11)  :: zero_pad
    character(100) :: read_tag,write_tag

    ! Local arrays
    integer(4), dimension(:), allocatable :: a_int,b_int,o_int

    ! Find the number of digits of the numbers
    a_size = len_trim(a)
    b_size = len_trim(b)

    ! Determine how many words we need
    a_words = ceiling(1D0*a_size/i_max)
    b_words = ceiling(1D0*b_size/i_max)
    o_words = a_words+b_words

    ! Allocate necessary arrays
    allocate(a_int(o_words))
    allocate(b_int(o_words))
    allocate(o_int(o_words))

    ! Initialize
    a_int = 0
    b_int = 0
    o_int = 0

    ! Break the inputs into words
    ! We actually store the numbers backwards in our arrays
    N_words = 1 + a_size/i_max
    write(read_tag,'(a,i12,a)') '(i',i_max,')'
    do i=1,N_words
       i1 = max(a_size - i*i_max + 1, 1)
       i2 = a_size - (i-1)*i_max
       read(a(i1:i2),trim(read_tag)) a_int(i)
    enddo

    N_words = 1 + b_size/i_max
    do i=1,N_words
       i1 = max(b_size - i*i_max + 1,1)
       i2 = b_size - (i-1)*i_max
       read(b(i1:i2),trim(read_tag)) b_int(i)
    enddo

    ! Add the numbers together one word at a time, and carry the results
    carry = 0
    do i=1,o_words
       temp = a_int(i) + b_int(i) + carry
       ! Only save the amount that will fit in i_max digits
       o_int(i) = mod(temp,i_max_10)
       ! Carry the rest
       carry = temp/i_max_10
    enddo

    ! Determine the final number of digits that we need to save our number
    ! First check to see if we over-allocated the number of words needed
    do while (o_int(o_words) == 0)
       o_words = o_words - 1
    enddo
    o_size = 1 + int(log10(1D0*o_int(o_words))) + i_max*(o_words-1)

    allocate(character(len=o_size) :: add_two_big_nums)

    ! Write out the answer
    write(write_tag,'(a,i11,a)') '(i',i_max,')'

    ! We actually go from right-to-left, since the big number is stored in
    !   the array as "little-endian" but we read the number as "big-endian"
    do i=1,o_words
       ! Find the bounds of this segment
       i1 = max(o_size - i*i_max + 1, 1)
       i2 = o_size - (i-1)*i_max

       ! Find the size of the write tag to make
       ! First, test to see if the segment is all zeros
       if (o_int(i)==0) then
          do idx=1,i_max
             write(zero_pad(idx:idx),'(a)') '0'
          enddo
          write(write_tag,'(a,i11,a)') '(a',i_max,')'
          write(add_two_big_nums(i1:i2),write_tag) trim(zero_pad)
          cycle
       endif 

       ! Now check to see if we need to pad with leading zeros
       include_pad = .false.
       do j=1,i2-i1
          ! Test to see if segment needs leading zeros
          if (mod(o_int(i),10**j)==o_int(i)) then
             include_pad = .true.
             write(write_tag,'(a,i11,a,i11,a)') '(a',i2-i1-j+1,',i',j,')'
             do idx=1,i2-j+1
                write(zero_pad(idx:idx),'(a)') '0'
             enddo
             exit
          endif
       enddo

       if (include_pad) then
          write(add_two_big_nums(i1:i2),write_tag) trim(zero_pad),o_int(i)
       else
          write(write_tag,'(a,i11,a)') '(i',i2-i1+1,')'
          write(add_two_big_nums(i1:i2),write_tag) o_int(i)
       endif
    enddo

    return
  end function add_two_big_nums

end module big_int_math
