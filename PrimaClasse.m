classdef PrimaClasse
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %documentazione della classe
        prop1 {mustBeNumeric} %proprietà numerica
        prop2 {mustBePositive} %proprietà positiva
        prop3 double %numero generico
    end
    
    methods
        function obj = PrimaClasse(p1,p2)
            %costruttore
            obj.prop1 = p1;
            obj.prop2 = p2;
            obj.prop3 = obj.prop1 + obj.prop2;
        end
    end
end

