abstract interface
    
    subroutine scheme(F,t1,t2,U1,U2)
        
        procedure (ODES):: F
        real,intent(in):: t1,t2,U1(:)
        real,intent(out):: U2(:)
        
    end subroutine
    
end interface