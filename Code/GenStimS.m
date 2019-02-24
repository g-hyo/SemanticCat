%% Generate stimuli
function [eng alt order] = GenStimR(subject, lang)
cd Stim;

f= fopen('eng.csv'); % open text file in matlab. Use f as pointer
eng = textscan(f, '%s'); % Save eng files as an array 
eng = eng{1,1}'; % access actual numbers
fclose(f); % allow us to open a new file

switch lang
    case 'Chinese'
        cd chi
        files = dir('*.jpg');
        for trial = 1:10;
        alt{trial} = imread(files(trial).name);
        end
        cd ..

    case 'Spanish'
        f= fopen('span.csv'); % open text file in matlab. Use f as pointer
        span = textscan(f, '%s'); % Save eng files as an array 
        alt = span{1,1}'; % access actual numbers
        fclose(f); % allow us to open a new file
        
end


stim_identity = [1:10]';
stim_type = [1,2]'; % This will determine cue and also trial type
load('StimOrder.mat'); 

order = finalOrder(subject + 100, :); %Use same orders generated for reading aloud, but move index 100 spots
cd .. 
end