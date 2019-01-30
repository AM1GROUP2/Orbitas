module Temporal_Schemes
use ODE_Interface

implicit none

abstract interface
    subroutine Temporal_Scheme(Time_Domain, Differential_Operator, Solution)

        use ODE_Interface
        procedure (ODES) :: Differential_Operator !Differential_Operator es la "F"
        
        real, intent(in) :: Time_Domain(0:)
        real, intent(inout) ::  Solution(0:,0:) 

    end subroutine
end interface

public :: Euler, Runge_Kutta2, Runge_Kutta4
public :: Temporal_Scheme, ODES 

contains

subroutine Euler( Time_Domain, Differential_Operator, Solution )

    procedure (ODES) :: Differential_Operator
    real, intent(in) :: Time_Domain(0:)
    real, intent(inout) ::  Solution(0:,:)
    real :: inct !Incremento de tiempo
    integer :: i
    
    !!-------------------------------------EULER ---------------------------------------
    do i=0,(size(Time_Domain)-2)
    inct=Time_Domain(i+1)-Time_Domain(i)
 
    Solution(i+1,:)=Solution(i,:)+inct*Differential_Operator(Solution(i,:),Time_Domain(i))

    end do
!!-----------------------------------FIN EULER--------------------------------------
!
end subroutine

subroutine Runge_Kutta2( Time_Domain , Differential_Operator , Solution)

procedure (ODES) :: Differential_Operator
real, intent(in) :: Time_Domain(0:)
real, intent(inout) ::  Solution(0:,:)
real :: inct, k1(size(Solution(0,:))), k2(size(Solution(0,:)))
integer :: i

!!-----------------------------------RUNGE-KUTTA2-----------------------------------
do i=0,(size(Time_Domain)-2)
 inct = Time_Domain(i+1) - Time_Domain(i)
   k1 = Differential_Operator ( Solution(i,:) , Time_Domain(i) )
   k2= Differential_Operator( Solution(i,:) + inct*k1 , Time_Domain(i)+inct )

   Solution(i+1,:)=Solution(i,:)+(inct/2.)*(k1+k2)

end do
!!-------------------------------------FIN RUNGE-KUTTA2-----------------------------

end subroutine

subroutine Runge_Kutta4( Time_Domain , Differential_Operator , Solution)

    procedure (ODES) :: Differential_Operator
    real, intent(in) :: Time_Domain(0:)
    real, intent(inout) ::  Solution(0:,:)
    real ::  k1(size(Solution(0,:))), k2(size(Solution(0,:))), k3(size(Solution(0,:))), k4(size(Solution(0,:))) !TAMAÑO = DIMENSIÓN DE U
    real :: inct
    integer :: i


!!-----------------------------------RUNGE-KUTTA4-----------------------------------
do i=0,(size(Time_Domain)-2)
 inct=Time_Domain(i+1)-Time_Domain(i)
 
   k1 = Differential_Operator( Solution(i,:), Time_Domain(i))
   k2 = Differential_Operator( Solution(i,:) + inct * (k1/2), Time_Domain(i) + (inct/2))
   k3 = Differential_Operator( Solution(i,:) + inct * (k2/2), Time_Domain(i) + (inct/2))
   k4 = Differential_Operator( Solution(i,:) + inct * k3    , Time_Domain(i) +  inct   )

    Solution(i+1,:)= Solution(i,:) + (inct/6.) * (k1 + 2*k2 + 2*k3 + k4)

end do
!!-------------------------------------FIN RUNGE-KUTTA4-----------------------------

end subroutine


end module