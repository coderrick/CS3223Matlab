function res = bfs(edges)
% @ return the order of vertices visted by breadth-first-search
%     start from the 1st vertex
% @ Params:
% @     edges: adjacent matrix of one graph,
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%
% @ Return:
% @     res = the order of vertices visted by breadth-first-search
% @ Usage example:
% @    res = bfs(edges)
% @ Author: Erkang Cheng
% @ Date: 10/24/2013

% hint: call explore for each vertex in the graph
% Figure 4.3


%% number of nodes in the graph
n = size(edges, 1);

%% define global variables and initialize values for them
% other function then can use them and set values for them
global visited;
visited = zeros(1, n);

global res_vec;
res_vec = [];

for i=1:n
    if (visited(i)==0)
        non_recursive_explore(edges, i);
        %create global variable distance and add to dist[v] vector ?
    end
end

res = res_vec;

end



%% helper function
%% non-recursive explore breadth-first-search


