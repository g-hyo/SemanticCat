    % This code presents a break screen 

        Screen('TextSize', wPtr, 20);
          DrawFormattedText(wPtr, 'Take a short break (at least 5 seconds). Then press any button to continue', 'center', 'center');
          Screen('Flip',wPtr);
           tic
          cd Data;
          save(study.filename, 'subj');  %Save in the middle of blocks
          cd ..
          
          while toc < 5 % Manual waiting loop that I've put in here
          end
          

          WaitSecs(iti);
        %  buttonState = PsychRTBox('WaitButtonDown', handle, {'odd','even'});   
         RTBox(1000); %Wait
          Screen('TextSize', wPtr, fontsize);