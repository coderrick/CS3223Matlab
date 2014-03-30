%Input: Edges in an arbitrary graph
%Output: a set of the previsit order and postvisist order
function [pre, post] = dfs_timings_expl(edges)
n = size(edges,1);
global visited; %The value can be accessed from any function.
visited = zeros(1,n);
global result_vector;%declared global variable
result_vector = [];% set it to empty vector that will be populated with answer
global clock;
clock = 1;
global previsit_vector;
previsit_vector = zeros(1,n);
global postvisit_vector;
postvisit_vector = zeros(1,n);
dfs_expl(edges);
pre = previsit_vector;
disp(pre);
post = postvisit_vector;
disp(post);
end