classdef TerzaClasse
    %TERZACLASSE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        p1 string
    end
    
    methods
        function obj = TerzaClasse(a)
            obj.p1 = a;
        end
        
        function vo = plus(vi1,vi2)
            c1 = char(vi1.p1);
            c2 = char(vi2.p1);
            c3(1,1:numel(c1)) = c1;
            c3(2,1:numel(c2)) = c2;
            vo = string(c3(:)');
        end
    end
end

