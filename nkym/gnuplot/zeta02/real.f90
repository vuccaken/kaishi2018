! real zeta

module binom_int_sub
  implicit none
contains
  recursive function binom(n,k) result(val)
    integer k, n
    real*8 val
    ! real*8 val
    if (n-k .lt. k) then
      k = n - k
    endif
    if (k .le. 0) then
      val = 1.0
    else
      val = (n/real(k)) * binom(n-1,k-1)
    end if
  end function
end module binom_int_sub

! - - - - - - - - - - - - - - - -

module lt1_zeta_sub
  implicit none
contains
  recursive function lt1_zeta(s,max) result(val)
    complex*8 s, val
    integer n, max
    if (real(s) .gt. 1) then
      val = 0
      do n = 1, max
        val = val + n ** (-s)
      enddo
    end if
  end function lt1_zeta
end module lt1_zeta_sub

! - - - - - - - - - - - - - - - -

module real_zeta2_sub
  implicit none
contains
  recursive function zeta(s) result(val)
  use binom_int_sub
  complex*8 s, summ, sumj, val
  integer m, j, m_max
  m_max = 10 ! デカイとオーバーフローする
  summ = 0
  do m = 1, m_max
    sumj = 0
    do j = 1, m
      sumj = sumj + (-1.0)**(j-1) * binom(m-1,j-1) * j**(-s)
    end do
    summ = summ + 2.0**(-m) * sumj
  end do
  val = summ / (1 - 2**(1-s))

  end function zeta
end module real_zeta2_sub

! - - - - - - - - - - - - - - - -

program main
  use real_zeta2_sub
  use lt1_zeta_sub
  implicit none
  real*8 ds, a,b
  complex*8 s
  ds = 0.01
  open(unit=10, file="real.dat", status='unknown')
    a = -5
    b = 5
    s = a
    do while (real(s) .le. b)
      write(10,*) real(s), real(zeta(s))
      s = s + ds
    enddo
  close(10)

  open(unit=11, file="lt1.dat", status='unknown')
    s = (1.0,0.0)
    do while (real(s) .le. b)
      s = s + ds
      write(11,*) real(s), real(lt1_zeta(s,10000))
    end do
  close(11)
end program main