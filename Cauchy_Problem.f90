module Cauchy_Problem
    
    use ODES
    
    contains
    
    subroutine Cauchy_Problem(Time_domain, Differential_operator, Temporal_scheme, Solution)
   
        real, intent(in):: Time_domain(:)
        procedure (ODES):: Differential_operator
        procedure,optional (scheme):: Temporal_scheme
        real,intent(inout):: Solution(:,:) !Temporal steps x # of variables
    
    end subroutine
    
end module
