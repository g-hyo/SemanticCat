%% Shut it all down 
ListenChar(0); % listen for keyboard again
Screen('CloseAll'); % Close the screen so you're back to normal matlab 
ShowCursor
cd Data; % change to data directory
save(study.filename, 'subj');
cd .. % Come back out to code directory