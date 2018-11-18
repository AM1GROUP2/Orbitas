module state_vector_evolution

implicit none

contains

subroutine Runge_Kutta_2s(Time_Domain,Differential_operator,Solution)

real, intent(in) :: Time_Domain(0:)
real, intent(inout) ::  Solution(0:,0:)
real :: inct, k1(2), k2(2)
integer :: i

interface
function Differential_operator( y, t ) 
real :: y(:), t
real :: Differential_operator(size(y))
end function Differential_operator
end interface



!RUNGE-KUTTA2
do i=0,(size(Time_Domain)-2)
 inct=Time_Domain(i+1)-Time_Domain(i)
   k1=Differential_Operator(Solution(i,:),Time_Domain(i))
   k2=Differential_Operator(Solution(i,:)+inct*k1,Time_Domain(i)+inct)

    Solution(i+1,:)=Solution(i,:)+(inct/2.)*(k1+k2)

end do

!EULER
!do i=0,(size(Time_Domain)-2)
!inct=Time_Domain(i+1)-Time_Domain(i)
 
!Solution(i+1,:)=Solution(i,:)+inct*Differential_Operator(Solution(i,:),Time_Domain(i))

!end do


end subroutine
end module