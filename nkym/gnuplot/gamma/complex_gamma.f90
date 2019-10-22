! 2018/11/21

module complex_gamma_sub
  implicit none
contains
  recursive function gamma(s) result(g)
    real*8 x, dx, pi, infty
    complex*8 s, int, g
    pi = 4.0 * atan(1.0)
    if (real(s) .gt. 0) then
      dx = 0.01 ! s = +0 辺りに影響
      x = 0
      infty = 10
      int = (0,0)
      do while (x .lt. infty)
        x = x + dx
        int = int + exp(-x) * x**(s-1) * dx
      enddo
      g = int
    else
      g = pi / gamma(1-s) / sin(pi*s)
      ! g = gamma(s+1) / s
    endif
  end function gamma
end module complex_gamma_sub

! - - -

program complex_main
  use complex_gamma_sub
  implicit none
  real*8 ds
  complex*8 s, s1

  s = (-5,-5)
  ds = 0.1

  open(unit=10, file="complex.dat", status='unknown')

  do while (aimag(s) .lt. 5)
    s1 = s
    do while (real(s1) .lt. 5)
      ! write(10,*) real(s1), aimag(s1), abs(gamma(s1))
      write(10,*) real(s1), aimag(s1), abs(gamma(s1))
      s1 = s1 + ds
    enddo
    s = s + (0,1)*ds
    write(10,*)
  enddo

  close(10)

end program complex_main