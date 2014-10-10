program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: target_sum = 1000

  ! Variables
  integer(4) :: a,b,c

  ! Do work
  outer: do a=1,target_sum
     do b=a,target_sum
        do c=b+1,target_sum
           if (is_triplet(a,b,c)) then
              if (a+b+c==target_sum) then
                 write(*,*) 'Special triple is: ',a,b,c
                 write(*,*) 'Product is: ',a*b*c
                 exit outer
              endif
           endif
        enddo
     enddo
  enddo outer


contains


  pure function is_triplet(a,b,c)
    ! Default
    implicit none

    ! Function arguments
    integer(4), intent(in) :: a,b,c
    logical                :: is_triplet

    ! Check if numbers are a triplet
    ! Assumes that a <= b < c
    if (a**2 + b**2 == c**2) then
       is_triplet = .true.
    else
       is_triplet = .false.
    endif

    return
  end function is_triplet


end program main
