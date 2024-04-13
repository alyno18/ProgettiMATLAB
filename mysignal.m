classdef mysignal
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        samplerate double {mustBeReal mustBePositive}
        starttime double {mustBeReal}
    end

    properties (Access = public)
        samples (:,1) double {mustBeReal}
    end

    methods
        function obj = mysignal(st,sr)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.samplerate = sr;
            obj.starttime = st;
        end

        function T = duration(obj)
            %DURATION Summary of this method goes here
            %   Detailed explanation goes here
            T = length(obj.samples) / obj.samplerate; %durata del segnale 
        end

        function plot(obj)
            t = (0:length(obj.samples)-1)'/obj.samplerate;
            plot(t,obj.samples)
        end

        function ms = plus(op1,op2)
            t1 = op1.starttime;
            t2 = op2.starttime;
            tstart = min(t1,t2);
            tstop = max(t1+op1.duration, t2+op2.duration);
            dur = tstop - tstart;
            t = tstart:1/op1.samplerate:tstop;
            ms = mysignal(tstart,op1.samplerate);
            ms.samples = zeros(round(dur*op1.samplerate),1);
            ind1 = t >= t1 & t < (t1+op1.duration);
            ms.samples(ind1) = ms.samples(ind1) + op1.samples;
            ind2 = t >= t2 & t < (t2+op2.duration);
            ms.samples(ind2) = ms.samples(ind2) + op2.samples;
        end

        function P = power(obj)
            P = (obj.samples'*obj.samples)/length(obj.samples);
        end
        
        function hear(obj)
            sound(obj.samples,obj.samplerate)
        end

        function spectrogram(obj)
            spectrogram(obj.samples,512,256,512,obj.samplerate,"yaxis")
        end
    end
end