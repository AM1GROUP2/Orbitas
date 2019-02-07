function[k1, k2, Solution] = Runge_Kutta2( TimeDomain , Differential_Operator , Solution)

    for i=0,(size(TimeDomain)-2)
    
        inct = TimeDomain(i+1) - TimeDomain(i);
        k1 = Differential_Operator(Solution(i,:), TimeDomain(i));
        k2 = Differential_Operator(Solution(i,:)+inct*k1, TimeDomain(i)+inct); 
        Solution(i+1,:) = Solution(i,:)+(inct/2.)*(k1+k2);

    end
    
end