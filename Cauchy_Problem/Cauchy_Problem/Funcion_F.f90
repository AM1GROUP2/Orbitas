module funcion_F

implicit none

    contains
    
!-----------------------------------------------------------------------------   
!-------------   |         OSCILADOR ARMÓNICO       |  -------------------------
!-----------------------------------------------------------------------------
    
 function F_Oscilador(U, t) result (F) 
    
    real :: U(:), t
    real :: F(size(U))
    
    
    !OSCILADOR ARMONICO
    
    F(1)=U(2)
    F(2)=-U(1)
  
    
 end function
 
!----------------------------------------------------------------------------
!-------------  |            FUNCIÓN DE BESSEL            |   ---------------
!----------------------------------------------------------------------------
    
 
 function F_Bessel (U, t) result (F) 
    
    real :: U(:), t
    real :: F(size(U))
    
    
     !BESSEL FUNCTION
    
     F(1)=U(2)
     F(2)=-(1./t)*U(2)-(((t**2)-1)/(t**2))*U(1)
    
 end function
 
 

!-----------------------------------------------------------------------------------------
!----------------------------| N CUERPOS 2D |------------------------------------------------
!-----------------------------------------------------------------------------------------

    function N_bodys2D(U,t)  result (F)
    
!!---------------------DECLARACIÓN DE VARIABLES--------------------------------------------

integer, parameter :: nbodys = 3
real:: U(0:), t
real :: F(0 : size(U)-1 )
real:: a(0:2*nbodys-1), r(0:2*nbodys-1), v(0:2*nbodys-1)
real:: drdt(0:2*nbodys-1), dvdt(0:2*nbodys-1)
real:: m(0:nbodys-1)
real::  G=6.674e-11 
integer :: i,j
    
!!-----------------FIN DE LA DECLARACIÓN DE VARIABLES--------------------------------------

    
!!---------VECTOR DE MASAS------------------------------------------
    
!m=(/5.972e24, 7.35e22, 1.9891e30/)
!m(0)=5.972e24
!m(1)=7.35e22

m(0)=10e24 !TIERRA
m(1)=10e22 !LUNA
m(2)=100   !SATÉLITE

!m(2)=10e23 !MARTE
!m(3)=2e30  !SOL

     
!!------------------------------------------------------------------

!!---------CONSTRUCCIÓN DEL VECTOR DE ESTADO U----------------------
     
     r=U(0:2*nbodys-1)
     v=U(2*nbodys:4*nbodys-1)

   
!!------------------------------------------------------------------

     
!!---------CONSTRUCCIÓN DE F----------------------------------------     
   do i=0,nbodys-1  !Cuerpo al que se le ejerce la fuerza

       
        a(2*i:2*i+1)=0

        do j=0,nbodys-1  !Cuerpos que ejercen la fuerza


            if (i/=j) then
                
            a(2*i:2*i+1)=a(2*i:2*i+1)+G*m(j)*(r(2*j:2*j+1)-r(2*i:2*i+1))/norm2(r(2*j:2*j+1)-r(2*i:2*i+1))**3
              
            end if

   end do

     
        dvdt(2*i:2*i+1)=a(2*i:2*i+1)
        drdt(2*i:2*i+1)=v(2*i:2*i+1)

   end do
 
    
    F(0:2*nbodys-1)=drdt(0:2*nbodys-1)
    F(2*nbodys:4*nbodys-1)=dvdt(0:2*nbodys-1)
   
    F=[drdt,dvdt]
    


    end function

!-----------------------------------------------------------------------------------------
!----------------------------| N CUERPOS 3D |------------------------------------------------
!-----------------------------------------------------------------------------------------

    function N_bodys3D(U,t)  result (F)
    
!!---------------------DECLARACIÓN DE VARIABLES--------------------------------------------

integer, parameter :: nbodys = 3
real:: U(0:), t
real :: F(0 : size(U)-1 )
real:: a(0:3*nbodys-1), r(0:3*nbodys-1), v(0:3*nbodys-1)
real:: drdt(0:3*nbodys-1), dvdt(0:3*nbodys-1)
real:: m(0:nbodys-1)
real::  G=6.674e-11 
integer :: i,j
    
!!-----------------FIN DE LA DECLARACIÓN DE VARIABLES--------------------------------------

    
!!---------VECTOR DE MASAS------------------------------------------
    
!m=(/5.972e24, 7.35e22, 1.9891e30/)
!m(0)=5.972e24
!m(1)=7.35e22

m(0)=10e24   !TIERRA
m(1)=10e22   !LUNA
m(2)=100     !SATÉLITE
     
!!------------------------------------------------------------------

!!---------CONSTRUCCIÓN DEL VECTOR DE ESTADO U----------------------
     
     r=U(0:3*nbodys-1)
     v=U(3*nbodys:6*nbodys-1)

   
!!------------------------------------------------------------------

     
!!---------CONSTRUCCIÓN DE F----------------------------------------     
   do i=0,nbodys-1  !Cuerpo al que se le ejerce la fuerza

       
        a(3*i:3*i+1)=0

        do j=0,nbodys-1  !Cuerpos que ejercen la fuerza


            if (i/=j) then
                
            a(3*i:3*i+1)=a(3*i:3*i+1)+G*m(j)*(r(3*j:3*j+1)-r(3*i:3*i+1))/norm2(r(3*j:3*j+1)-r(3*i:3*i+1))**3
              
            end if

   end do

     
        dvdt(3*i:3*i+1)=a(3*i:3*i+1)
        drdt(3*i:3*i+1)=v(3*i:3*i+1)

   end do
 
    
    F(0:3*nbodys-1)=drdt(0:3*nbodys-1)
    F(3*nbodys:6*nbodys-1)=dvdt(0:3*nbodys-1)
   
    F=[drdt,dvdt]
    


    end function
    
    
    
Function Keppler (U,t) result (F)

real :: U(0:), t
real :: F(0: Size(U)-1)
real :: r(3), v(3), dvdt(3), muT=3.986044418E14

!varaibles internas satelite              !Se puede ampliar a varios satelites al mismo tiempo
real  :: DryMass =1000, FuelMass=200, Mass_consu, MassTotal
real  :: E=1., Isp=2000*9.81
real :: Ev (3)


!Programa
r=U(0:2)
v=U(3:5)
mass_consu=(E/Isp)*t
    
    if(mass_consu>FuelMass) then
        E =0
        mass_consu=FuelMass
    else
        Ev = E*(v/norm2(v))
        mass_consu=mass_consu
    end if
    
MassTotal = DryMass + FuelMass - Mass_consu    

dvdt= -muT*r/(norm2(r)**3) + Ev/MassTotal

F(0:2)=v
F(3:5)=dvdt

end function 
    
      end module  