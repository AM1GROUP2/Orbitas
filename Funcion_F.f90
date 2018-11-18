module funcion_F

implicit none

contains

function Differential_operator(y,t) 

    real :: y(:), t, a(0:2*n-1), r(2,n), v(2,n), m(n), drdt(2,n), dvdt(2,n)
    real :: Differential_operator(size(y))
    
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
    
    do i=1,n
        a(i)=0
        do j=1,n
            if (i/=j) then
            d(:)=r(:,j)-r(:,i)
            a(:)=a(:)+G*m(j)*d(:)/norm2(d(:))**3
            end if
        end do
        dvdt(:,i)=a(:)
        drdt(:,i)=v(:,i)
    end do
    
    Differential_operator(0:2*n-1,:)=drdt
    Differential_operator(2*n,4*n-1)=dvdt
    
    
end function

end module