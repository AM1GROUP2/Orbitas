%% Oscilador armónico

function[F] = F_Oscilator(U)

    F(1) = U(2);
    F(2) = -U(1);
    
end

%% Función de Bessel

function[F] = F_Bessel(U,t)

    F(1)=U(2);
    F(2)=-(1./t)*U(2)-(((t^2)-1)/(t^2))*U(1);
    
end

%% N cuerpos en 2 dimensiones

function[F] = N_Bodys2D(U)

    nbodys = 4;
    G = 6.674e-11;
    
    m(0)=10e24;  %Tierra
    m(1)=10e22;  %Luna
    m(2)=10e23;  %Marte
    m(3)=2e30;   %Sol
    
    r=U(0:2*nbodys-1);
    v=U(2*nbodys:4*nbodys-1);
    
    for i = 0:nbodys-1
        
        a(2*i:2*i+1)=0;
        
        for j = 0:nbodys-1
            
            if (i~=j) 
                
            a(2*i:2*i+1) = a(2*i:2*i+1) + G * m(j) * (r(2*j:2*j+1) ...
                -r(2*i:2*i+1)) / norm2(r(2*j:2*j+1) - r(2*i:2*i+1))^3;
              
            end
            
        end
        
        dvdt(2*i:2*i+1) = a(2*i:2*i+1);
        drdt(2*i:2*i+1) = v(2*i:2*i+1);
    
    end
    
    F = [drdt,dvdt];
end
