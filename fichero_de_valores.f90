module Fichero_Cauchy_problem

implicit none

contains

subroutine Fichero(t,U,m)

integer, intent(in) ::  m
real, intent(in) :: t(0:m), U(0:m,2)
integer :: w

open (10, file="Fichero_Cauchy_Problem.txt")
write (10,50)

50 format ("tn",60x,"Solución de la ecuación diferencial")

do w=0,m
write (10,100) t(w), U(w,:)
end do
100 format (3(f30.10,20x))
close(10)
end subroutine

    end module
    
    
 !para que el matlab te guerde variables en vectores a partir de excels para pintarlos   
 !xlsread()
!velocidad=xlsread('nombre del excel', 1, 'B1:B100') !QUE EL VECTOR VELOCIDAD