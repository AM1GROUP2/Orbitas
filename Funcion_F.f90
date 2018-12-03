module funcion_F

implicit none

    contains

!-----------------------------------------------------------------------------------------
!----------------------------| N CUERPOS |------------------------------------------------
!-----------------------------------------------------------------------------------------

!    function Differential_operator(y,t) 
!    
!!!---------------------DECLARACIÓN DE VARIABLES--------------------------------------------
!
!integer, parameter :: nbodys = 2
!real:: y(0:), t
!real :: Differential_operator(size(y))
!real:: a(0:2*nbodys-1), r(0:2*nbodys-1), v(0:2*nbodys-1)
!real:: drdt(0:2*nbodys-1), dvdt(0:2*nbodys-1)
!real:: m(0:nbodys-1)
!real::  G=6.674e-11 
!integer :: i,j
!    
!!!-----------------FIN DE LA DECLARACIÓN DE VARIABLES--------------------------------------
!
!    
!!!---------VECTOR DE MASAS------------------------------------------
!    
!!m=(/5.972e24, 7.35e22, 1.9891e30/)
!m(0)=5.972e24
!m(1)=7.35e22
!!m(2)=1.
!     
!!!------------------------------------------------------------------
!
!!!---------CONSTRUCCIÓN DEL VECTOR DE ESTADO y ----------------------
!     
!     r=y(0:2*nbodys-1)
!     v=y(2*nbodys:4*nbodys-1)
!
!   
!!!------------------------------------------------------------------
!
!     
!!!---------CONSTRUCCIÓN DE F----------------------------------------     
!   do i=0,nbodys-1  !Cuerpo al que se le ejerce la fuerza
!
!       
!        a(2*i:2*i+1)=0
!
!        do j=0,nbodys-1  !Cuerpos que ejercen la fuerza
!
!
!            if (i/=j) then
!                
!            a(2*i:2*i+1)=a(2*i:2*i+1)+G*m(j)*(r(2*j:2*j+1)-r(2*i:2*i+1))/norm2(r(2*j:2*j+1)-r(2*i:2*i+1))**3
!              
!            end if
!
!   end do
!
!     
!        dvdt(2*i:2*i+1)=a(2*i:2*i+1)
!        drdt(2*i:2*i+1)=v(2*i:2*i+1)
!
!   end do
! 
!    
!    !Differential_operator(0:2*nbodys-1)=drdt
!    !Differential_operator(2*nbodys:4*nbodys-1)=dvdt
!   
!    Differential_operator=[drdt,dvdt]
!    
!
!
!    end function

!!---------------------------------------------------------------------------
!!--------| FIN DE LA DECLARACIÓN DE LA F DE LOS N CUERPOS |-----------------
!!---------------------------------------------------------------------------
    

    
!-----------------------------------------------------------------------------   
!------------- OTRAS FUNCIONES ----------------------------------------------- 
!-----------------------------------------------------------------------------
    
    function Differential_operator(y,t) 
    
    real :: y(:), t
   real :: Differential_operator(size(y))
!    
!    !Differential_operator(1)=y(2)
!    !Differential_operator(2)=cos(2*t)-sin(y(1))
!    
!    !BESSEL FUNCTION
!   ! Differential_operator(1)=y(2)
!   ! Differential_operator(2)=-(1./t)*y(2)-(((t**2)-1)/(t**2))*y(1)
!    
!    
!    !OSCILADOR ARMONICO
!    
!
Differential_operator(1)=y(2)
Differential_operator(2)=-y(1)
!  
!    
    end function
!    
      end module  