! 初等的解析接続

module binom_sub
  implicit none
contains
  recursive function binom(n,k) result(val)
    integer k
    complex*8 n, val
    ! if (n-k .lt. k) then
    !   k = n - k
    ! endif
    if (k .eq. 0) then
      val = 1
    else
      val = binom(n-1,k-1) * (n/real(k))
    end if
  end function
end module binom_sub

! - - - - - - - - - - - - - - - -

module real_zeta_sub
  implicit none
contains
  recursive function zeta(s) result(val)
  use binom_sub
    complex*8 s, sum, val
    integer n, n_max, k, k_max
    real*8 pi
    pi = 3.14159265358979

    if (real(s) .gt. 1) then
      val = (0,0)
      do n = 1, 10000
        val = val + n ** (-s)
      enddo
    else
      k_max = 3 - real(s) + 2
      sum = (0,0)
      do k = 2, k_max
        sum = sum + binom(-s,k-1)/real(k) * (zeta(s-1+k) - 1)
      enddo
      val = 1 + 2**(1-s) / (s-1) - sum
      ! val = sum
    end if
  end function zeta
end module real_zeta_sub

! - - - - - - - - - - - - - - - -

program main
  use real_zeta_sub
  implicit none
  real*8 pi, ds, new, old,a,b
  complex*8 s, s1
  pi = 3.14159265358979

  open(unit=10, file="real-zeta.dat", status='unknown')
  ds = 0.01
  a = -5
  b = 5
  s = a
    do while (real(s) .le. b)
      new = real(zeta(s))
      if (real(s) .ge. 0.5 .and. old / new .lt. 0) then
        write(10,*)
      end if
      write(10,*) real(s), new
      s = s + ds
      old = new
    enddo

  close(10)

end program main