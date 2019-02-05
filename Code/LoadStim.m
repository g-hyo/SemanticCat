%% This module will load stimuli into the correct order
% This will generate a lot of variables, but the most important ones are:
% finalorder = the final stimuli items as they are presented
% stimorder = the preset "slot" ordering, this has information on switch  trial status
% freq = the final stimuli frequencies as they are presented (nonwords = 0)


% First load the "slots" order
load('stim/PresOrder.mat')

%%
% Now load the stimuli
SW = importdata('stim/SpanStim.csv');
EW = importdata('stim/EngStim.csv');
SNW = importdata('stim/SpanNonWord.csv');
ENW = importdata('stim/EngNonWord.csv');

%%
%seeed = 1; %set twister seed in case you need to regenerate stim order. This should eventually be different for each participant
%seeed = subj_no

rng(mapSeed, 'twister')
order1 = randperm(length(SW.data));
%% Load Spanish Stim
SpanWords = SW.textdata(order1);
SpanFreq = SW.data(order1);

%% Load English Stim
rng(mapSeed + 1, 'twister')
order2 = randperm(length(SW.data));
EngWords = EW.textdata(order2);
EngFreq = EW.data(order2);

%% Load NonWords
EngNonWords = ENW(randperm(length(SW.data)));
SpanNonWords = SNW(randperm(length(SW.data)));


%% Great, now paste the word stimuli onto the preset order that we've created

finalorder = {};
freq = [];

% These counters make sure we don't get duplicate items
SCounter = 1; 
ECounter = 1;
SNWCounter = 1;
ENWCounter = 1;

for i = 1:length(StimOrder)
    if StimOrder(i,1) == 1
        finalorder{i,1} = EngWords(ECounter);
        freq(i,1) = EngFreq(ECounter);
        ECounter = ECounter + 1;
    elseif StimOrder(i,1) == 2
        finalorder{i,1} = SpanWords(SCounter);
        freq(i,1) = SpanFreq(SCounter);
        SCounter = SCounter + 1;
    elseif StimOrder(i,1) == 3
        finalorder{i,1} = EngNonWords(ENWCounter);
        freq(i,1) = 0; % Make sure nonwords are coded as frequency 0 
        ENWCounter = ENWCounter + 1;
    elseif StimOrder(i,1) == 4
        finalorder{i,1} = SpanNonWords(SNWCounter);
        freq(i,1) = 0; 
        SNWCounter = SNWCounter + 1;
    end
end

%% set number of trials per block

 numpblock = 28;


