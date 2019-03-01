% This code will initialize the psych RT box

%handle = PsychRTBox('Open'); 
% Try to open a connected RTBox, return a device handle 'handle' to it on success.

RTBox('ClockRatio'); % Correct drift between RTbox clock and screen
% Comment out for practice

%clockRatio = PsychRTBox('clockratio'); % Comment out while testing??
% Calculate drift between computer and RT box

%PsychRTBox('ButtonNames',[], {'even', '2', '3', 'odd'})
RTBox('ButtonNames', {'even' 'even' 'odd' 'odd'});

% Set up RT box button mapping

%PsychRTBox('CloseAll');
% Close RT box