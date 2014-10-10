program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: max_val = 999

  ! Variables
  integer(4) :: i,j,max_pal,prod

  ! Do work
  max_pal = 1
  do i=1,max_val
     do j=i,max_val
        prod = i*j
        if (is_pal(prod)) then
           max_pal = max(prod,max_pal)
        endif
     enddo
  enddo

  ! Write out result
  write(*,*) "Max palindrome: ",max_pal


contains


  pure function is_pal(targ)
    ! Default
    implicit none

    ! Local parameters
    integer(4), parameter :: max_places = 1 + int(log10(1D0*max_val**2))

    ! Function arguments
    integer(4), intent(in) :: targ
    logical                :: is_pal

    ! Local variables
    integer(4)            :: i,len_targ
    character(max_places) :: targ_char
    character(100)        :: tag
    character             :: ic,jc

    ! Write the product as a character
    if (max_places < 1e10) then
       write(tag,'(a,i10,a)') '(i',max_places,')'
    else
       write(tag,'(a,i100,a)') '(i',max_places,')'
    endif
    write(targ_char,tag) targ

    ! Find the length of the string
    len_targ = len_trim(targ_char)

    ! Test whether it's a palindrome
    do i=1,len_targ/2
       !write(ic,'(a1)') targ_char(i:i)
       !write(jc,'(a1)') targ_char(len_targ-i+1:len_targ-i+1)
       ic = targ_char(i:i)
       jc = targ_char(len_targ-i+1:len_targ-i+1)
       if (ic/=jc) then
          is_pal = .false.
          return
       endif
    enddo

    is_pal = .true.
    return
  end function is_pal


end program main
