function [sa] = responseSpectrum( dt, accel, period, damping )
% Compute the response spectrum for a acceleration time series.
%
% dt		time step
% accel		acceleration time series
% period	natural period of the oscillator (can be a vector of period values)
% damping	damping of the oscillator
%
% Originally coded by Albert Kottke, 2006
% Factor of 10 increase in speed by Peter Stafford, 2008

%% Compute the fourier Amplitude spectrum
% Increase the number of points so that it is next higher power of 2.

pow = 1;

while  (2 ^ pow  < length(accel))
	%pow = bitshift( pow, 1 );
    pow = pow + 1;
end
% be conservative and increment once more to ensure sufficient zero-padding for signals with length close to 2^pow
pow = pow + 1;

nPts = 2 ^ pow;

% Compute the Fourier Amplitude spectrum.  The spectrum is padded with zeros.
fas = fft( accel, nPts );

% Compute the frequency array

dFreq = 1 / ( dt * ( nPts - 1 ) );
freq = dFreq * (0 : (nPts-1));

%% Compute the transfer function

% The index of symmetry -- about this index the Hermitian symmetry exists.
if mod(nPts,2)
	% The number of points is odd.
	symIdx = ceil(nPts/2);
else
	% The number of points is even
	symIdx = 1 + nPts / 2;
end

% Allocate sa and H
sa = zeros(size(period));
H = ones(size(fas));
% For each period compute the transfer function
for i = 1 : length(period)
	% Determine the natural frequency of the oscillator
	natFreq = 1 / period( i );
	% Calculate the SDOF transfer function the value at a frequency of zero
	% (j=1) is one.
    H(2:symIdx)	= natFreq^2 ./ ( ( natFreq ^ 2 - freq(2:symIdx).^2  ) + 2 * sqrt(-1) * damping * freq(2:symIdx) * natFreq);

    % Apply the Hermitian symmetry to fill the rest of the vector
	if mod(nPts,2)
        H((end-length(2:symIdx)+1):end) = flipdim(conj(H(2:symIdx)),1);
    else
        H((end-length(2:symIdx)+2):end) = flipdim(conj(H(2:(symIdx-1))),1);
    end

    %Apply the transfer function and then find the maximum absolute value
	%of the time history
	sa(i) = max( abs( real( ifft( H .* fas ) ) ) );
end