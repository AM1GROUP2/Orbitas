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
    real :: t0 = 1, tf = 10*2*acos(-1.)
    integer :: i
    integer, parameter :: n = 2500
    real :: t (0:n), U (0:4*n-1, 2) !U (0:n, 2)

    ! Body of Cauchy_Problem
    
    t = [ (t0 + (tf-t0) * i / (n), i=0,n)]
    
    U(0,:) = [1., 0.]
    
    call Runge_Kutta_2s(Time_Domain=t,Differential_operator=Differential_operator,Solution=U)
    
    !call qplot(t,U(:,1),n)
    !call Fichero(t,U,n)
    
      call scrmod("reverse")
      call metafl('XWIN')
    !print*, U(0:n,1)
    call qplot (U(:,1),U(:,2),n+1)
    end program Cauchy_Problem

