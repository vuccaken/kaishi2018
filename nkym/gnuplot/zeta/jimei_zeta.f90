! jimei zeta

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

module jimei_zeta_sub
  implicit none
contains
  recursive function zeta(s) result(val)
  use binom_sub
    complex*8 s, sum, val
    integer n, n_max, k, k_max

    if (real(s) .gt. 1) then
      val = (0,0)
      do n = 1, 100
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
end module jimei_zeta_sub

! - - - - - - - - - - - - - - - -

program main
  use jimei_zeta_sub
  implicit none
  real*8 ds, new, old, a,b
  complex*8 s
  open(unit=10, file="jimei-zeta.dat", status='unknown')

  ds = 0.01
  a = -50
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