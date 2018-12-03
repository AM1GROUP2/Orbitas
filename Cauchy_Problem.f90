!  Cauchy_Problem.f90 
!
!  FUNCTIONS:
!  Cauchy_Problem - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: Cauchy_Problem
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program Cauchy_Problem
    use funcion_F
    use state_vector_evolution
    use Fichero_Cauchy_problem
    use dislin

    implicit none

    ! Variables
    real :: t0 = 1, tf = 10*2*acos(-1.) !1000*2*acos(-1.)
    integer :: i
    integer, parameter :: n = 2500 !n=pasos de tiempo
    real :: t (0:n), U(0:n,2), E(0:n,2) !U(0:n,0:4*2-1)  !cambiar la dimensión del vector de estado si se cambia el numero de cuerpos

    ! Body of Cauchy_Problem
    
    t = [ (t0 + (tf-t0) * i / (n), i=0,n)]
    
    
   
    !U(0,:) = [0., 0., 3.5e8, 0., 0., 12.3, 0., 1e3]!, 1.5e4, 1.5e4, 0., 0.]
    !U(0,:) = [0., 1., 1., 0., 1., 0., 0., 1., 1., 1., 0., 0.]
    U(0,:)=[0.,1.]
    

    call Scheme(Time_Domain=t,Differential_operator=Differential_operator,Solution=U)
    
    !call qplot(t,U(:,1),n)
    !call Fichero(t,U,n)
    
      call scrmod("reverse")
      call metafl('XWIN')
    !print*, "x luna", U(:,2)
    !print*, "y luna", U(:,3)
    
    call qplot (U(:,1),U(:,2),n+1)
    
    !---EXTRAPOLACIÓN DE RICHANSON
    !E(0:n,:)=[U(0:n,:)-U(0:2*n:2,:)]/1e-3
    !call qplot (abs(E),t,n+1)
    end program Cauchy_Problem

