classdef SecondaClasse
    %SECONACLASSE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %documentazione della classe
        prop1 {mustBeNumeric} %proprietà numerica
        prop2 {mustBePositive} %proprietà positiva
        prop3 double %numero generico
    end
    
    methods
        function obj = SecondaClasse(p1,p2)
            %costruttore
            obj.prop1 = p1;
            obj.prop2 = p2;
            obj.prop3 = obj.prop_1 + obj.prop2;
        end
        
        function a = metodo1(obj)
            %primo metodo
            a = obj.prop1 * obj.prop2;
        end
        function a = metodo2(obj, b)
            %secondo metodo
            a = obj.metodo1 + b;
        end
        function c = metodo3(d)
            c = d;
        end
    end
end

