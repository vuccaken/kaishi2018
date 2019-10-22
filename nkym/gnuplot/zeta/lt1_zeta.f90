! s > 1



! - - - - - - - - - - - - - - - -

module lt1_zeta_sub
  implicit none
contains
  recursive function zeta(s,max) result(val)
    real*8 s, val
    integer n, max
    if (real(s) .gt. 1) then
      val = 0
      do n = 1, max
        val = val + n ** (-s)
      enddo
    end if
  end function zeta
end module lt1_zeta_sub

! - - - - - - - - - - - - - - - -

program main
  use lt1_zeta_sub
  implicit none
  real*8 s, ds
  integer max,i

  open(unit=10, file="lt1-zeta.dat", status='unknown')

  ds = 0.01
  s = 1.00
  do while (s .le. 3)
    s = s + ds
    write(10,*) s, zeta(s,10), zeta(s,100), zeta(s,1000), zeta(s,10000), zeta(s,100000), zeta(s,1000000)
  enddo

  close(10)

end program main