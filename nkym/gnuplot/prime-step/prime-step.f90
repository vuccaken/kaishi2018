program prime_step
implicit none
integer n, s, x, px

open(unit=11, file="100.dat", status='unknown')

px = 0

do x = 0, 100
  call IsPrime(x,s) ! 素数判定
  if (s .eq. 1) then ! n is prime
    write(11,*) x, px
    px = px + 1
  end if
  if (x .gt. 1) then
    write(11,*) x, px, f(real(x)), li(real(x))
  else
    write(11,*) x, px
  end if
end do

close(11)


contains ! - - - - - - - -

real function f(x)
implicit none
real x

if (x .gt. 1) then
  f = x / log(x)
else
  f = 0
end if

end function

! - - - - - - - - - - - -

real function li(x)
implicit none
real x, u, du

du = 0.1
u = 2.0
li = 0.0

do while (u .lt. x)
  li = li + du / log(u)
  u = u + du
end do

end function


end program prime_step