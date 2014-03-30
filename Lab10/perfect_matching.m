%Input: G = (E,V); a graph with vertices V and edges E
%Output: A boolean determing if a perfect matching exists
function res = perfect_matching(edges)
    n = size(edges, 1);
    global visited;
    visited = zeros(1, n);
    
    %for loop through the vertices
    explore(edges, 1);
    res = true;% The graph is a perfect matching
    for vertices = 1:n
        if (visited(vertices) == 0)% If a visited vertice does not have an edge then set res to false
            res = false;% The graph is not a perfect matching
        end
    end
end

function explore(edges, idx_start)
    n = size(edges, 1);
    
    global visited;
    visited(idx_start) = 1;

    for idx_neighbor = 1:n
        if edges(idx_start, idx_neighbor)==1
            if visited(idx_neighbor) == 0
                explore(edges, idx_neighbor);
                if idx_start ~= 1 
                    break;
                end
            end
        end
    end
end
