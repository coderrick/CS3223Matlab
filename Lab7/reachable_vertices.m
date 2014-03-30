function res = reachable_vertices(edges)

num_vertices = length(edges);
result = [];
for i = 1:num_vertices      %3loop through each vertex using num vertices as an index
num_reachable_vertices = length(cal_reachable_vertices(edges, 3))-1;
    if(num_reachable_vertices == num_vertices - 1)% condition:ntv equal to num vertices - 1 then
    result = [result i];
    end;
end
end

%6result vector equals [result and index]
%7show result vector.
% @ find the vertex can be reached from all other vertices in the graph
% @ Params:
% @     edges: adjacent matrix of one graph, graph is directed graph
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%        
% @ Return: 
% @     res = such vertices if found, otherwise -1
% @ Usage example:
% @    res = find_reachable_vertices_from_others(edges)
% @ Author: Erkang Cheng
% @ Date: 10/24/2013


%% add your own codes here
