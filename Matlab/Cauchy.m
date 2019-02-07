function[U,time] = Cauchy_Problem(U, Funcion_F, Scheme, state_vector_evolution, t, n)
    
    U = U;
    time = state_vector_evolution(t,n);

    for i = 1:n

    U_i = U(:,i);
    dt = time(i+1)-time(i);
    U(:,i+1) = Scheme(@Time_Domain, t, F); 

    end

end