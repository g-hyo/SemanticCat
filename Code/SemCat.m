try
clear all;

lang = getLang;
[y, Fs] = audioread('error.wav'); % load error sound
iti = .4; % inter-trial blank duration
fct = .4; % fixation cross duration

Box %initialize box settings
screensettings %initialize screensettings
subjectinfo
LoadStim % load the stimulus order for each participant

instructionscreens 
   
pracrun

RunExperiment

cd('Results')

save(study.filename); %save everything, but the most important is RT, accu and stimulus information

sca;

PsychRTBox('CloseAll');

ListenChar(1);

end

