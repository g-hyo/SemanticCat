% This is for reading in Spanish and English

for trial = curtrial:numtrials;

    Screen('TextSize', wPtr, fontsize);

    WaitSecs(iti); % Inter-trial interval
        
    % Determine identity of trial using modulo
    stim = mod(StimOrder(trial),10);
    if stim == 0
        stim = 10; % Use 10 if modulo is actually 0
    end
    
    % tstim is the trial stimulus for this particular trial
    if StimOrder(trial) > 9 % If number is over 9, then item is Spanish
           tstim =alt{stim};        
    else % If not, item is english
            tstim = eng{stim}; 
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%
    % Present trial
    
    % Draw Cross
    DrawCross(wPtr, rect, 10)
    Screen('Flip', wPtr);
    DrawFormattedText(wPtr, tstim, 'center', 'center');        
    
    WaitSecs(cit); %Jitters prestim interval is 1 second. This will be the fixation duration for the flag
    subj.pt(trial) = Screen('Flip', wPtr); % Record flip time
    
    
    %%%% KEY RESPONSE %%%%
    keyIsDown = 0;
    
    while ~keyIsDown
    [keyIsDown, secs, keyCode] = KbCheck; 
        if keyCode(27) % Escape if escape is pressed
            ShutDown
            sca;
            return
       
        elseif keyCode(37) % If left is pressed
            if mod(stim,2) == 0 % If EVEN press a
               subj.response(trial)= 1;
            else
              sound(y, Fs);
              subj.response(trial)= 0;
            end
        
            % Add results to matrix
            subj.RT(trial) = secs-subj.pt(trial);
  
        elseif keyCode(39) % If right is pressed
            if mod(stim,2) == 1 % If ODD press l
               subj.response(trial)= 1;
            else
              sound(y, Fs);
              subj.response(trial)= 0;
            end
        
            % Add results to matrix
            subj.RT(trial) = secs-subj.pt(trial);
        
        elseif keyCode(32) % If spacebar is pressed for whatever reason, punish. 
              sound(y, Fs);
              subj.response(trial)= -1;
     
        end  
    
    end  
    %%% END KEY RESPONSE %%%%%
    
    
    Screen('Flip',wPtr);

    % Break
    if mod(trial,numbreak) == 0;
        GiveBreak;
    end
   
end 
