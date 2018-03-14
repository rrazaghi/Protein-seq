clear 
clc 
close all
%% Import the Events
[~, ~, raw] = xlsread('/Users/rohamrazaghi/Dropbox (Timp Lab)/protein_seq/dtwM/BetaA+scrambled030518.xlsx','Beta Amyloid best 10 events');
raw = raw(2:end,2:end);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

% Create output variable
data = reshape([raw{:}],size(raw));

% Allocate imported array to column variable names
Ev1_best = data(:,1);
Ev2 = data(:,2);
Ev3 = data(:,3);
Ev4 = data(:,4);
Ev5 = data(:,5);
Ev6 = data(:,6);
Ev7 = data(:,7);
Ev8 = data(:,8);
Ev9 = data(:,9);
Ev10 = data(:,10);

% Clear temporary variables
clearvars data raw R;
%% Import Beta Amyloid Model

[~, ~, raw] = xlsread('dtwM/BetaA+scrambled030518.xlsx','Beta Amyloid Model (42 points)');
raw = raw(3:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
raw = raw(:,2);

% Create output variable
data = reshape([raw{:}],size(raw));

% Allocate imported array to column variable names
model_seq = cellVectors(:,1);
model = data(:,1);

% Clear temporary variables
clearvars data raw cellVectors;

%% Import Scrambled Events
[~, ~, raw] = xlsread('dtwM/BetaA+scrambled030518.xlsx','Scrambled-Beta Amyloid best 10');
raw = raw(2:end,2:end);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

% Create output variable
data = reshape([raw{:}],size(raw));

% Allocate imported array to column variable names
Ev1_SC_best = data(:,1);
Ev2_SC = data(:,2);
Ev3_SC = data(:,3);
Ev4_SC = data(:,4);
Ev5_SC = data(:,5);
EV6_SC = data(:,6);
EV7_SC = data(:,7);
EV8_SC = data(:,8);
EV9_SC = data(:,9);
EV10_SC = data(:,10);

% Clear temporary variables
clearvars data raw R;

%% Import Scrambled Beta Amyloid Model

[~, ~, raw] = xlsread('BetaA+scrambled030518.xlsx','Scrambled-Beta Amyloid Model');
raw = raw(3:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
raw = raw(:,2);

% Create output variable
data = reshape([raw{:}],size(raw));

% Allocate imported array to column variable names
model_SC_seq = cellVectors(:,1);
model_SC = data(:,1);

% Clear temporary variables
clearvars data raw cellVectors;

%% Sample Calculation for Event 1:
d = dtw_pairwise_amyloid(model,Ev1_best);