Program test_Kepler
    
    integer,parameter:: N=100
    integer:: i
    real:: t0=0; tf=1000
    real:: Time(0:N)
    real:: U(0:N,4)
    
    U(0,:)= [1,0,0,1]
    Time= [(t0+(tf-t0)*i/N,i=0,N)]
    call Cauchy_Problem(Time_domain=Time, Differential_operator=Kepler, Solution= U)
    
contains
    function Kepler(U,t) result(F)
        real,intent(in):: U(:),t
        real:: F(size(U))
        
        real::r(2), drdt(2)
        r= U(1:2); drdt= U(3:4)
        F=[drdt, -r/norm2(r)**3]
    end function
    
end program