function d_list = dtw_pairwise(query,ref)
%% Zero Offset the signals
query = detrend(query);
ref = detrend(ref);

% l_t = length(ref);
% l_q = length(query);

%% Optimal Scaling Factor Calculation
start_coor = [];
d_list = [];

% for (ii = 10:10:8000)   %Going from 10X to 8000X with the interval of 10.
for ii = 1./(10:10:500)
    
    start_coor(end+1) = ii;
    d = dtw(query*ii,ref);
    d_list(end+1) = d ;
    
end
ind = find(d_list == min(d_list));
x_min = start_coor(ind);
y_min = min(d_list);

%% Plot the distances and the Optimal Alignment
figure()
plot(start_coor,d_list)
xlabel('Scaling factor')
ylabel('Euclidian Distances')
title('Distances for different Scaling factors (Event X)')
hold on
plot(x_min,y_min,'r*')
figure()
dtw(query*x_min,ref)

end