program main
  implicit none
  integer(4) :: dow,mo,yr,ns

  ! Figure out day of week for each month
  dow = 1
  yr  = 1900
  ns  = 0

  do yr=1900,2000
     do mo=1,12
        if (yr>1900 .and. dow==0) then
           ns = ns + 1
        endif
        if (mo==1 & ! jan
             .or. mo==3 & ! mar
             .or. mo==5 & ! may
             .or. mo==7 & ! jul
             .or. mo==8 & ! aug
             .or. mo==10 & ! oct
             .or. mo==12) then ! dec
           dow = mod(dow+31,7)
        else if (mo==4 & ! apr
             .or. mo==6 & ! jun
             .or. mo==9 & ! sep
             .or. mo==11) then ! nov
           dow = mod(dow+30,7)
        else ! feb
           if (mod(yr,4)==0) then
              ! potential leap year
              if (mod(yr,100)==0) then
                 if (mod(yr,400)==0) then
                    ! leap year
                    dow = mod(dow+29,7)
                 else
                    ! no leap year
                    dow = mod(dow+28,7)
                 endif
              else
                 ! leap year
                 dow = mod(dow+29,7)
              endif
           endif
        endif
     enddo
  enddo

  write(*,*) "number of sundays on the first of the month: ",ns

end program main
