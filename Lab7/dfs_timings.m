%Input: Edges in an arbitrary graph
%Output: a set of the previsit order and postvisist order
function [pre, post] = dfs_timings(edges)
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
dfs(edges);
pre = previsit_vector;
disp(pre);
post = postvisit_vector;
disp(post);
end









% @ return pre and post visting time of each vertex in the graph
%     
% @ Params:
% @     edges: adjacent matrix of one graph, 
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%        
% @ Return: 
% @     pre  = 1 x n vector, n is the number vertices in the graph
% @     post = 1 x n vector, n is the number vertices in the graph
%       pre(i)  is the timing when 1st time visting i-th vertex in the graph
%       post(i) is the timing when 2nd time visting i-th vertex in the graph
%
% @ Usage example:
% @    [pre, post] = dfs_timings(edges)
% @ Author: Erkang Cheng
% @ Date: 10/10/2013

% hint: call dfs and add previst before explore and postvist after explore
% section 3.2.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%