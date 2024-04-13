classdef morsecode < mysignal

    properties
        audiofrequency double {mustBeNonnegative}
        numberofbits double {mustBeInteger mustBePositive}
        bitrate double {mustBePositive}
    end

    methods

        function obj = morsecode(st,sr,af,nb,br) %af = audio frequency, br = bitrate, nb = numer of bits
            obj = obj@mysignal(st,sr);
            obj.audiofrequency = af;
            obj.numberofbits = nb;
            obj.bitrate = br;
            obj = obj.prepsamples;
        end
    end

    methods (Access = private)
        function obj = prepsamples(obj)
            bits = randi([0 1],[obj.numberofbits 1], "uint8");
            N = round(obj.numberofbits * obj.samplerate / obj.bitrate);
            obj.samples = zeros(N,1);
            bind = floor(obj.bitrate * (0:N-1)' / obj.samplerate)+1;
            obj.samples = double(bits(bind));
            % for n = 0:N-1
            %     obj.samples(n+1) = double(bits(floor(obj.bitrate * n / obj.samplerate)+1));
            % end
            obj.samples = obj.samples .* cos(2*pi*obj.audiofrequency*(0:N-1)'/obj.samplerate);
        end
    end
end