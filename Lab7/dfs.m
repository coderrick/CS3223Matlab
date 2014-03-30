%Is mostly working but is missing the unconnected components must fix.
function res = dfs(edges)
n = size(edges,1);%finding # of rows (nxn matrix; its size of graph;
global visited; %The value can be accessed from any function.
visited = zeros(1,n);

global clock;
clock = 1;

global connected_component;
connected_component= 1;


global result_vector;%declared global variable
result_vector = [];% set it to empty vector that will be populated with answer

for vertices = 1:n
    if (visited(vertices) == 0)
    explore(edges,vertices);
    end
      
end

res = result_vector;























%Depth-first search algorithm
%{
procedure dfs(G)
for all v <- V (vertices)
    visited(v) = false;
    

for all v <- V (vertices)
    if not visited(v): explore;

This algorithm is used to traversed the unconnected vertices that
could not be reach by explore(edge,v) because it doesn't have reachable 
neighbor vertices.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% @ return the order of vertices visted by depth-first-search
%     start from the 1st vertex
% @ Params:
% @     edges: adjacent matrix of one graph, 
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%        
% @ Return: 
% @     res = the order of vertices visted by depth-first-search
% @ Usage example:
% @    res = dfs(edges)
% @ Author: Erkang Cheng
% @ Date: 10/10/2013

% hint: call explore for each vertex in the graph
% Figure 3.5