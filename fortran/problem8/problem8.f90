program main
  ! Default
  implicit none

  ! Parameters
  integer(4), parameter :: window_size = 13

  ! Big-ass number
  character(*), parameter :: row01 = &
       '73167176531330624919225119674426574742355349194934'
  character(*), parameter :: row02 = &
       '96983520312774506326239578318016984801869478851843'
  character(*), parameter :: row03 = &
       '85861560789112949495459501737958331952853208805511'
  character(*), parameter :: row04 = &
       '12540698747158523863050715693290963295227443043557'
  character(*), parameter :: row05 = &
       '66896648950445244523161731856403098711121722383113'
  character(*), parameter :: row06 = &
       '62229893423380308135336276614282806444486645238749'
  character(*), parameter :: row07 = &
       '30358907296290491560440772390713810515859307960866'
  character(*), parameter :: row08 = &
       '70172427121883998797908792274921901699720888093776'
  character(*), parameter :: row09 = &
       '65727333001053367881220235421809751254540594752243'
  character(*), parameter :: row10 = &
       '52584907711670556013604839586446706324415722155397'
  character(*), parameter :: row11 = &
       '53697817977846174064955149290862569321978468622482'
  character(*), parameter :: row12 = &
       '83972241375657056057490261407972968652414535100474'
  character(*), parameter :: row13 = &
       '82166370484403199890008895243450658541227588666881'
  character(*), parameter :: row14 = &
       '16427171479924442928230863465674813919123162824586'
  character(*), parameter :: row15 = &
       '17866458359124566529476545682848912883142607690042'
  character(*), parameter :: row16 = &
       '24219022671055626321111109370544217506941658960408'
  character(*), parameter :: row17 = &
       '07198403850962455444362981230987879927244284909188'
  character(*), parameter :: row18 = &
       '84580156166097919133875499200524063689912560717606'
  character(*), parameter :: row19 = &
       '05886116467109405077541002256983155200055935729725'
  character(*), parameter :: row20 = &
       '71636269561882670428252483600823257530420752963450'

  character(*), parameter :: big_num = row01//row02//row03//row04//row05//row06&
       //row07//row08//row09//row10//row11//row12//row13//row14//row15//row16&
       //row17//row18//row19//row20

  integer(4), parameter :: len_str = len_trim(big_num)

  ! Variables
  integer(8) :: prod,max_prod
  integer(4) :: i

  ! Do work
  max_prod = 0
  do i=1,len_str-window_size+1
     prod = calc_prod(big_num,i)
     max_prod = max(prod,max_prod)
  enddo

  ! Write out result
  write(*,*) 'The largest product of ',window_size,' consecutive numbers is: ',&
       max_prod


contains


  pure function calc_prod(num,istart)
    ! Default
    implicit none

    ! Function arguments
    character(*), intent(in) :: num
    integer(4),   intent(in) :: istart
    integer(8)               :: calc_prod

    ! Local variables
    integer(4) :: i
    integer(8) :: prod,fac

    ! Compute the product of the factors
    prod = 1
    do i=istart,istart+window_size-1
       read(num(i:i),'(i1)') fac
       prod = prod*fac
    enddo

    calc_prod = prod
    return
  end function calc_prod


end program main
