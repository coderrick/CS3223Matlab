%Input: G = (E,V); a graph with vertices V and edges E
%Output: Return true or false (1 or 0) if graph remains connected after
%removing an edge
%Theorem |E| > |V| - 1
%I tested it with edge_removable([0 1 0 0 1 0; 1 0 1 0 1 0; 0 1 0 1 0 0; 0
%0 1 0 1 1; 1 1 0 1 0 0; 0 0 0 1 0 0]) and the graph you gave us in lab 7
%edges
function res = edge_removable(edges)
n_vertices = size(edges, 1);
n_edges = length(find(edges))/2;%computing non zero indices and storing the length to compare it later with number of vertices.
    if (n_edges > (n_vertices - 1))
        res = true;%The graph will remain connected
    else
        res = false;%The graph will not be connected 
    end
end
