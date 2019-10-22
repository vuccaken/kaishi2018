! jimei zeta

module int_binom_sub
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
end module int_binom_sub

! - - - - - - - - - - - - - - - -


! - - - - - - - - - - - - - - - -

program main
  use int_binom_sub
  integer m, j, m_max

  open(unit=10, file="binom.dat", status='unknown')

  m_max = 50
  do m = 1, m_max
    do j = 1, m
      write(10,*) m-1, j-1, int(binom(m-1,j-1))
    end do
  end do

  close(10)

end program main