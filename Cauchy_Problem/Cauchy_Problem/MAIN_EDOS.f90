    program MAIN_EDOS

    use Cauchy
    use funcion_F
    use state_vector_evolution
    use dislin_mod
    use Temporal_Schemes_SinBucles
  
    implicit none
  
    !**********************************
    !           Variables
    !**********************************
    real :: t0 = 1,  tf = 100*0.665*24*3600 !tf=10*2*3.14
    integer :: i,condition
    integer :: nbodys = 3 !CAMBIAR nbodys aquí y en el Funcion_F
    integer, parameter :: n = 25000 !n=pasos de tiempo
    real, allocatable :: U(:,:), Up(:), Uk(:,:)  !cambiar dimension a vector para poincare
    real :: t (0:n) , Uo(0:n,2)
   
    allocate (U(0:n,4*nbodys),Up(0:6*nbodys), Uk(0:n,6))
    !***********************************
  
    !***********************************
    ! PARTICIÓN TEMPORAL: EQUIESPACIADA
    !***********************************
    
    t = [ (t0 + (tf-t0) * i / (n), i=0,n)]
    
    !Uo(0,:)=[0.,1.]
    
    
!****************************************************************
! CONDICIONES INICIALES PARA EL PROBLEMA DE KEPLER
!****************************************************************
    
    Uk(0,:)=[0.  , - 5e7 , 0.,  &           
              3.e3, 0. , 0. ]          
!**************************************************************** 
 
!****************************************************************
! CONDICIONES INICIALES PARA EL SISTEMA TIERRA-LUNA-SATÉLITE
!****************************************************************
    
    U(0,:)=[ 0. ,0. , &           !POSICIÓN X-Y DE LA TIERRA
              3.84e8 , 0. , &     !POSICIÓN X-Y DE LA LUNA
              0.  , - 5e7 , &     !POSICIÓN X-Y DEL SATÉLITE
              0. , -10. , &       !VELOCIDAD EN X-Y DE LA TIERRA
              0. , 1e3 , &        !VELOCIDAD EN X-Y DE LA LUNA
              3.e3, 0. ]          !VELOCIDAD EN X-Y DEL SATÉLITE
!****************************************************************         
    
!**************************************************    
! CONDICIONES INICIALES PARA SOL-TIERRA-MARTE-LUNA   
!**************************************************
    !U(0,:)=[ 1.5e11 ,0. , &          !POSICIÓN X-Y DE LA TIERRA
    !         1.5e11 , -3.84e8 , &    !POSICIÓN X-Y DE LA LUNA
    !         2.3e11  , 0. , &        !POSICIÓN X-Y DE MARTE
    !         0. ,  0. ,    &         !POSICIÓN X-Y DEL SOL
    !         0. , 30.e3 , &          !VELOCIDAD EN X-Y DE LA TIERRA
    !         1.e3 , 30.e3 , &        !VELOCIDAD EN X-Y DE LA LUNA
    !         0. ,   24.e3 , &        !VELOCIDAD EN X-Y DE MARTE
    !         0., 0. ]                !VELOCIDAD EN X-Y DEL SOL
!***************************************************
    
    call Cauchy_Problem ( Time_Domain = t, Differential_Operator =  N_bodys2D, Scheme = Runge_Kutta4, & 
        
        Solution=U) !POR DEFECTO ESTÁ EL ESQUEMA Runge_Kutta 2. Si se quiere utilizr otro se debe incluir en los argumentos.
    
    
     call Cauchy_Problem ( Time_Domain = t, Differential_Operator =  Keppler, Scheme = Runge_Kutta4, & 
        
        Solution=Uk)
    
    !****************************************
    ! PLOTS PARA SISTEMA TIERRA-LUNA-SATÉLITE
    !****************************************
    call scrmod("reverse")
    call metafl('XWIN')
    !call plot (U(:,3)/1.E6,U(:,4)/1.E6, xlabel = 'X 10^6', ylabel = 'Y 10^6', plottitle = 'POSICION DE LA TIERRA-LUNA-SATELITE', hold_on = .true. , plotcolor = 'RED' ) 
    !call plot (U(:,1)/1.E6,U(:,2)/1.E6, hold_on = .true., plotcolor = 'BLUE')
    call plot (U(:,5)/1.E6,U(:,6)/1.E6, hold_on = .true., plotcolor = 'WHITE')
    !call plot_legend (['POSICION LUNA', 'POSICION TIERRA', 'POSICION SATELITE'])
    call plot_legend (['POSICION SATELITE'])
    call plot_end ()
   !*****************************************
    
    !******************************************
    ! PLOTS PARA SISTEMA TIERRA-LUNA-MARTE-SOL
    !******************************************
    !call scrmod("reverse")
    !call metafl('XWIN')
    !call plot (U(:,5)/1.E9,U(:,6)/1.E9, xlabel = 'X 10^6', ylabel = 'Y 10^6', plottitle = 'POSICION DE LA TIERRA-LUNA-MARTE-SOL', hold_on = .true. , plotcolor = 'RED' ) !MARTE
    !call plot (U(:,1)/1.E9,U(:,2)/1.E9, hold_on = .true., plotcolor = 'BLUE') !TIERRA
    !call plot (U(:,3)/1.E9,U(:,4)/1.E9, hold_on = .true., plotcolor = 'WHITE') !LUNA
    !call plot (U(:,7)/1.E9,U(:,8)/1.E9, hold_on = .true., plotcolor = 'YELLOW') !SOL
    !call plot_legend (['POSICION MARTE', 'POSICION TIERRA', 'POSICION LUNA', 'POSICION SOL'])
    !call plot_end ()
    !*********************************
    
    
    !****************************************
    ! PLOTS PARA EL PROBLEMA DE KEPLER
    !****************************************
    call scrmod("reverse")
    call metafl('XWIN')
    call plot (Uk(:,1)/1.E6,Uk(:,2)/1.E6, xlabel = 'X 10^6', ylabel = 'Y 10^6', plottitle = 'PROBLEMA DE KEPPLER', hold_on = .true. , plotcolor = 'WHITE' ) 
  
    call plot_legend (['POSICION SATELITE'])
    call plot_end ()
   !*****************************************

    !call scrmod("reverse")
    !call metafl('XWIN')
    !call plot (t,Uo(:,1), plottitle = 'FUNCION DE BESSEL', plotcolor = 'BLUE' ) 
    
    !!!Condiciones poincare
    
     Up(:)=[ 0. ,0. ,0., &              !POSICIÓN X-Y DE LA TIERRA
              3.84e8 , 0., 0. , &       !POSICIÓN X-Y DE LA LUNA
              0., - 5e7 , 0., &         !POSICIÓN X-Y DEL SATÉLITE
              0. , -10., 0., &          !VELOCIDAD EN X-Y DE LA TIERRA
              0. , 1e3 , 0., &          !VELOCIDAD EN X-Y DE LA LUNA
              0.5e3, 0., 0. ]          !VELOCIDAD EN X-Y DEL SATÉLITE
    
!    condition=1
!    
!      open (10, file="Poncare.txt")
!        write (10,50)
!        50 format ("y",60x,"z")
!do i=0,10
!    Up(10)=2.9e3+ i*0.02e3
     
call Poncare (Time_Domain = t, Differential_Operator=N_bodys3D, Scheme= Runge_Kutta4_SB, Solution=Up)
!condition =condition+1
!end do


        !close(10) 
    end program MAIN_EDOS