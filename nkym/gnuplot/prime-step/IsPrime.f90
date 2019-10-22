!******************************************************
!   素数判定
!   Is "n" prime number?
!   Y -> s = 1
!   N -> s = 0
!*****************************************************

subroutine IsPrime(n,s)
implicit none
integer i, max, n, s


if (n .le. 1) then ! n <= 1 is not prime
  s = 0
else if (n .eq. 2) then ! n = 2 is prime
  s = 1
else if (mod(n,2) .eq. 0) then ! i = 2 * k
  s = 0
else
  max = sqrt(real(n)) + 1 ! i max
  do i = 3, max, 2 ! i = 3, 5, 7,..., max
    if (mod(n,i) .eq. 0) then ! n is not prime
      s = 0 
      exit ! out loop
    else ! n is prime
      s = 1
    end if
  end do
end if

return
end
