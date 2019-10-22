program test
implicit none
complex val,s,sum
integer n

s = (2,7)
sum = 3

  val = 1 + 2**(1-s) / (s-1) - sum

  write(*,*) val

end program test