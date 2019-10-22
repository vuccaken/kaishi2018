      implicitnone
      real*8 pi,y,t,A
      integer n,m,x
      open(10,file='kukeiha1000.dat',status='unknown')
      pi=4.0*atan(1.0)
      write(*,*)"nを入力"
      read(*,*) n !2n+1倍音まで足し合わせるためのnを入力
      
      do x=0,4000
       y=0.d0 !yの初期化
       t=x/1000000.d0 !時間を０msから4msまで0.001ms刻みで増やすため

      do m=1,n
       A=2.d0*m-1.d0
       y=(4.d0/pi)*(1.d0/A)*sin(A*t*2.d0*pi/0.002)+y
       enddo

       write(10,*)t,y

       enddo  
      close(10)
      stop
      end
