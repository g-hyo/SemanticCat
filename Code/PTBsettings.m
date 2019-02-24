%% Setup PTB
study.debug_mode = 0;  % allows you to see the screen while running the program. set to 1 to turn on.

Priority(2); % set psychtoolbox priority for computer. This should be 2 for testing
HideCursor;
ListenChar(2); % supress keyboard input

if study.debug_mode;
    PsychDebugWindowConfiguration(0.5); % will set the transparent screen so you can debug 
end % debug window on

%% Screen settings

Screen('Preference','SkipSyncTests', 1); % This skips the synchronisation tests. Turn this off for actual testing!!

[wPtr, rect] = PsychImaging('OpenWindow',0); 
[screenXpixels, screenYpixels] = Screen('WindowSize', wPtr);

black=BlackIndex(wPtr); % black is the intensity value to produce black at current screen depth
white = WhiteIndex(wPtr); % white is the intensity value to produce white at the current screen depth
grey = white/2;

centerX = rect(3)/2; % defines the centre X coordinate of screen from rect
centerY = rect(4)/2; % defines the centre Y coordinate of screen from rect
