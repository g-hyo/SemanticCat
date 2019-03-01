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
   
    %% Check for escape routine (before trial begins so we don't mess with that timing)
    [keyisdown, secs, keyCode] = KbCheck;
    if keyCode(27) % Escape if escape is pressed
            ShutDown
            sca;
            return
          end
          
    subj.pt(trial) = Screen('Flip', wPtr); % Record flip time and present stimulus
         
    
  %% RT box response
%     PsychRTBox('Clear', handle); % Flush events before collecting response
    RTBox('clear'); % clear buffer and sync clocks before stimulus onset
    tPress = []; % Set up empty matrix for 
     
     % Query RTbox for a response
  %   while isempty(tPress);
        [tPress, evt] = RTBox(100); % Wait 100 seconds for a response
   %  end
     
     
        if strcmp(evt, 'even') == 1; % If left button is pressed
            if mod(stim,2) == 0 % If EVEN 
               subj.response(trial)= 1;
            else
              sound(y, Fs);
              subj.response(trial)= 0;
            end
        
        
         % Add results to matrix
            subj.RT(trial) = tPress-subj.pt(trial);
  
        elseif strcmp(evt, 'odd') == 1; % If right is pressed
            if mod(stim,2) == 1 % If ODD 
               subj.response(trial)= 1;
            else
              sound(y, Fs);
              subj.response(trial)= 0;
            end
        
            % Add results to matrix
            subj.RT(trial) = tPress-subj.pt(trial);
        end
     
    %%% END KEY RESPONSE %%%%%
    
    
    Screen('Flip',wPtr);

    % Break
    if mod(trial,numbreak) == 0;
        GiveBreak;
    end
   
end 
