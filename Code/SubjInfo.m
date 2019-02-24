function [subject filename] = SubjInfo(wPtr,lang)
% Optional to do: Collect this before opening a screen?
% Define Text Formatting for instruction
Screen('TextSize', wPtr, 20);
Screen('TextFont', wPtr, 'Helvetica');
Screen('TextStyle', wPtr, 0);


subject = str2double(Ask(wPtr,'Enter Subject Number (followed by Enter or Return):', 0, 255, 'GetChar',[0 0 1000 200], 'center', 20)); 
% Asks for subject number. Converts the answer into a number instead of a string. 

initials = Ask(wPtr,'Enter Subject initials(2):', 0, 255, 'GetChar', [0 0 1000 200], 'center', 20); 
% reduces likelihood of overwriting file if accidentally enter same subject number twice 

filename = sprintf('s%02d_%s_%s_SemCat.mat',subject,initials,lang); % generate a filename for particular session
% sprintf formats data into string using variables. %d is for integers (02 indicates that we want at least 2 digits here). %s for strings


end

