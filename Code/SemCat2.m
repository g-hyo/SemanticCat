%% Simple semantic categorization task either in Chinese or in Spanish
% Written by Gabriel Ong 5/2/2019

% To do: Delete all references to cues. 
% Use drawcross
% Randomise left-right responses

%% TODO: Similar to final name
% Clear all variables and the screen
clear all; clc; % Clear the screen

%% Determine which language the task responses are going to be in 
lang = getLang();

%% Trial settings
numtrials = 320; % Has to be 160 due to generated trial order
iti = .4; %inter-trial interval (amount of time between trials)
cit = .5; %cue interval
numbreak = 20; % number of trials before giving people a break
fontsize = 60; %Define font size for stimuli
pdims = [200, 160]; % For chinese characters this is the size of the character.
pdims = pdims * 1; % Multiply size of picture by scalar


%% Audio and Screen Settings
%AudioSettings; 
[y, Fs] = audioread('error.wav'); % load error sound
PTBsettings; % Change this code if you want to run debug mode
RestrictKeysForKbCheck([27, 37, 39, 32]); % Only use esc, left, right and spacebar keys

%% Code used to Enter Subject Information
[subject study.filename] = SubjInfo(wPtr, lang);

%% Generate stimuli based on subject and language used
[eng alt StimOrder] = GenStimS(subject, lang);  % Note this also contains order information


%% Load or setup trial info
% Try and load file if it exists (can only be saved if we run crash.mat OR
% from the block where they crashed)

try 
  load(study.filename)
catch
  subj.response = nan(numtrials,1); % Setup empty matrix for responses
  subj.RT = zeros(numtrials,1); % Setup empty matrix for RTs
  subj.trial_identity = StimOrder; % Get order info. % Note this could be made a bit more efficient by just recording this in GenStimR
  % Note that identity = 1 to numtrials
  % 1 -> numtrials/2 are English, the rest are Spanish
  % The identity of the number presented is given by modulo (identity, 10)
  subj.pt = nan(numtrials,1); % presentation time
end

% Go to the current trial (i.e., one with no response yet)
tmp = 1:numtrials;
curtrial=min(tmp(isnan(subj.pt)));

%% Now let's present some instructions!
Screen('TextSize', wPtr, 15);

line2 =sprintf('\n In this task you need to state whether the number which appears is odd or even'); %\n means new line
line3 = sprintf('\n \n The numbers will be written in either their English or %s word forms.',lang); 
line4 = sprintf('\n \n \n If the number is even, press the left button. If the number is odd, press the right button'); % This is below line 1. 
line5 = '\n \n \n \n Incorrect trials will be indicated with a buzzing noise. Correct trials will proceed without any sound';
line6 = '\n \n \n \n \n Press spacebar to begin with some practice trials'; 
DrawFormattedText(wPtr, [line2 line3 line4 line5 line6], 'center', 'center', black);
Screen('Flip', wPtr);
WaitSecs(.5);
KbWait;
Screen('TextSize', wPtr, fontsize);

%% Let's present practice trials
if strcmp(lang, 'Chinese')
    Cprac;
else
    Sprac;
end

%% Now let them know the real task is starting
Screen('TextSize', wPtr, 15);

line2 ='\n Well done! Now we will begin with the real task'; %\n means new line
line3 = '\n \n Responses and response times will now be recorded'; % This is below line 1. Hence two \n's
line4 = '\n \n \n Try to respond as quickly as possible without making errors';
line5 = '\n \n \n \n \n Press any key to continue'; 
DrawFormattedText(wPtr, [line2 line3 line4 line5], 'center', 'center', black);
Screen('Flip', wPtr);
WaitSecs(.5);
KbWait;


%% %% Now let's run the task based on the language

if strcmp(lang, 'Chinese')
    ChiS; % Next step, edit these
else
    SpanS; % Next step, edit these
end


%% Present Final Screen unless experimenter exitted
try
Screen('TextSize', wPtr, 20);
DrawFormattedText(wPtr, 'Finished! Press a button and call experimenter', 'center', 'center');
Screen('Flip', wPtr);

WaitSecs(1);
catch
    disp('Experiment Terminated Early')
end    



%% Shut it all down 
ShutDown


