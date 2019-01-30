module ODE_Interface
    
abstract interface
function ODES (U, t)
    real :: U(0:), t
    real :: ODES( size(U) )
    
end function
end interface

 end module
    
