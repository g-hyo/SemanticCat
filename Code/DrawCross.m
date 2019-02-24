function DrawCross(wPtr, rect, CrossLength)


% Define start and end point of lines
crosslines = [-CrossLength CrossLength 0 0; 0 0 -CrossLength CrossLength];

% Define center of screen
centreX = rect(3)/2;
centreY = rect(4)/2;

% Draw Lines
Screen('DrawLines', wPtr, crosslines, 2, 1, [centreX centreY]);

end