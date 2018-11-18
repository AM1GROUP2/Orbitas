module funcion_F

implicit none

contains

function Differential_operator(y,t,nbodys) 

    integer :: nbodys
    real :: y(:), t
    real:: a(2*nbodys), r(2*nbodys), v(2*nbodys), m(nbodys), drdt(2*nbodys), dvdt(2*nbodys),d(2)
    real:: G=6.674e-11
    real :: Differential_operator(size(y))
    integer :: i,j
    
     m=(/5.972e24, 7.35e22 /)
     
     v=Differential_operator(2*nbodys+1:4*nbodys)
     r=Differential_operator(1:2*nbodys)
    
    !Differential_operator(1)=y(2)
    !Differential_operator(2)=cos(2*t)-sin(y(1))
    
    !BESSEL FUNCTION
   ! Differential_operator(1)=y(2)
   ! Differential_operator(2)=-(1./t)*y(2)-(((t**2)-1)/(t**2))*y(1)
    
    
    !OSCILADOR ARMONICO
    
!Differential_operator(1)=y(2)
!Differential_operator(2)=-y(1)
    
    !N Cuerpos
    
    !Differential_operator(1)=y(2)
    !Differential_operator(2)=y(4)
    !Differential_operator(3)=m(2)*y(1)/m(1)
    !Differential_operator(4)=
    
    do i=1,nbodys
        a(i)=0
        do j=1,nbodys
            if(i==j) then
            a(2*(i-1)+1:2*(i-1)+2)=0
            elseif (i/=j) then
            d(:)=r(2*(i-1)+1:2*(i-1)+2)-r(2*(j-1)+1:2*(j-1)+2)
            a(2*(i-1)+1:2*(i-1)+2)=a(2*(i-1)+1:2*(i-1)+2)+G*m(j)*d(:)/norm2(d(:))**3
            end if
        end do
        dvdt(2*(i-1)+1:2*(i-1)+2)=a(:)
        drdt(2*(i-1)+1:2*(i-1)+2)=v(2*(i-1)+1:2*(i-1)+2)
    end do
    
    Differential_operator(1:2*nbodys)=drdt
    Differential_operator(2*nbodys+1:4*nbodys)=dvdt
    
    
end function

end module