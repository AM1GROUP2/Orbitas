subroutine Euler (F,t1,t2,U1,U2)
    
    procedure (ODE):: F
    real,intent(in):: t1,t2,U1(:)
    real,intent(out):: U2(:)
    
    U2 = U1 + (t2-t1) * F(U1,t1)
    
end subroutine