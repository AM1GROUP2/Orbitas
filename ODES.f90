module EDOS
    
    contains
    
        abstract interface
    
            function ODES(U,t) result(F)
    
            real,intent(in):: U(:), t
            real:: F(size(U))
        
        end function

    end interface  
    
end module