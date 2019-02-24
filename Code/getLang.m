function [language] = getLang()
% This function will prompt experimenter to enter task language and return
% the output lang

% output lang will be c for chinese and s for spanish
lang =0; 
    while ~lang
        lang = char(input('What language is the task? \n', 's'));
            if ~strcmp(lang, 's') & ~strcmp(lang, 'c')
                disp 'Please enter valid input ("c" for Chinese or "s" for Spanish)'
                lang = 0;
            else
            end
    end
   
    if lang == 'c'
        language = 'Chinese'
    else
        language = 'Spanish'
    end

end

