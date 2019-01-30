module Temporal_Schemes_SinBucles
use ODE_Interface

implicit none

abstract interface
    subroutine Temporal_Scheme_SB(Differential_Operator, U1, U2, t1, t2)

        use ODE_Interface
        procedure (ODES) :: Differential_Operator !Differential_Operator es la "F"
        
        real, intent(in) :: t1, t2
        real, intent(inout) :: U1(0:), U2(0:) 

    end subroutine
end interface

public ::  Runge_Kutta4_SB
public :: Temporal_Scheme_SB, ODES 

    contains
    
    subroutine Runge_Kutta4_SB( Differential_Operator , U1, U2, t1, t2)

    procedure (ODES) :: Differential_Operator
    real, intent(in) ::  t1, t2
    real, intent(inout) ::  U1(0:), U2(0:)
    real ::  k1(size(U1(:))), k2(size(U1(:))), k3(size(U1(:))), k4(size(U1(:))) !TAMAÑO = DIMENSIÓN DE U
    real :: inct
   

    !!-----------------------------------RUNGE-KUTTA4-----------------------------------

 inct=t2-t1
 
   k1 = Differential_Operator( U1, t1)
   k2 = Differential_Operator( U1 + inct * (k1/2), t1 + (inct/2))
   k3 = Differential_Operator( U1 + inct * (k2/2), t1 + (inct/2))
   k4 = Differential_Operator( U1 + inct * k3    , t1 +  inct   )

   U2= U1 + (inct/6.) * (k1 + 2*k2 + 2*k3 + k4)


!!-------------------------------------FIN RUNGE-KUTTA4-----------------------------

end subroutine


end module