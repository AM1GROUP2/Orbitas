module Cauchy
    
    use Temporal_Schemes_SinBucles
    use Temporal_Schemes
    use ODE_Interface
    use dislin_mod

    
    implicit none
    
    contains
    
    subroutine Cauchy_Problem (Time_Domain, Differential_Operator, Scheme, Solution)
    
        real, intent (in) :: Time_Domain (:)
        procedure (ODES) :: Differential_Operator
        procedure (Temporal_Scheme), optional :: Scheme
        
        real, intent (inout) :: Solution (:,:)
        
        if (present(Scheme)) then 
            
            call scheme (Time_Domain, Differential_Operator, Solution)
            
        else
            call Runge_Kutta2(Time_Domain,Differential_Operator,Solution)
            
        end if
        
    end subroutine
        
    
 subroutine Poncare (Time_Domain, Differential_Operator, Scheme, Solution)
    
        real, intent (in) :: Time_Domain (0:)
        procedure (ODES) :: Differential_Operator
        procedure (Temporal_Scheme_SB) :: Scheme
       
        
        real, intent (inout) :: Solution (:)
        real:: point(3)  !intoducir varaible point dimensión coordenadas
        real, allocatable:: next_step(:)
        integer :: i, n
        
        allocate (next_step(size(Solution)))
        n=25000
        
        open (10, file="Poncare.txt")
        write (10,50)
        50 format ("y",60x,"z")
        do i=0, n-1
            
        call Runge_Kutta4_SB (Differential_Operator, U1 = Solution , U2=next_step , t1 = Time_Domain (i) , t2 = Time_Domain (i + 1))

        
       if(Solution(7)*next_step(7)<0)then
           Point=(Solution(7:9)+next_step(7:9))/2.
          !call qplsca (point(2)/1.E5,point(3), 1 )
          write (10,100)  point(2)/1.E5, point(3)
          
       end if
       Solution=next_step
       
       end do
        100 format (2(f30.10,20x))
        close(10) 
           
        end subroutine
end module   