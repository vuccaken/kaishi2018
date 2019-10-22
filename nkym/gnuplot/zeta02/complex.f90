! jimei zeta

module int_binom_sub
  implicit none
contains
  recursive function binom(n,k) result(val)
    integer k, n, val
    if (n-k .lt. k) then
      k = n - k
    endif
    if (k .eq. 0) then
      val = 1
    else
      val = binom(n-1,k-1) * (n/real(k))
    end if
  end function
end module int_binom_sub

! - - - - - - - - - - - - - - - -

module hijimei_zeta2_sub
  implicit none
contains
  recursive function zeta(s) result(val)
  use int_binom_sub
    ! complex*8 s, sum, val
    ! integer n, n_max, k, k_max

    ! if (real(s) .gt. 1) then
    !   val = (0,0)
    !   do n = 1, 100
    !     val = val + n ** (-s)
    !   enddo
    ! else
    !   k_max = 3 - real(s) + 2
    !   sum = (0,0)
    !   do k = 2, k_max
    !     sum = sum + binom(-s,k-1)/real(k) * (zeta(s-1+k) - 1)
    !   enddo
    !   val = 1 + 2**(1-s) / (s-1) - sum
    !   ! val = sum
    ! end if

  complex*8 s, summ, sumj, val
  integer m, j, m_max
  m_max = 100
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
end module hijimei_zeta2_sub

! - - - - - - - - - - - - - - - -

program main
  use hijimei_zeta2_sub
  implicit none
  real*8 ds, new, old, a,b
  complex*8 s
  open(unit=10, file="hijimei.dat", status='unknown')

  ds = 0.01
  a = 0
  b = 50
  s = a
  ! do while (real(s) .le. b)
  !   write(10,*) real(s), real(zeta(s))
  !   s = s + ds
  ! enddo
  s = a*(0,1) + (0.5,0)
  do while (aimag(s) .le. b)
    write(10,*) aimag(s), abs(zeta(s))
    s = s + ds*(0,1)
  enddo

  close(10)

end program main