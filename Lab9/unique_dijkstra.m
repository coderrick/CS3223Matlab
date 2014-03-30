function [distance isUnique] = dijkstra(edges,source)
    n_vertices = size(edges,1);
    visited = zeros(1,n_vertices);
    isUnique = ones(1,n_vertices);
    distance = Inf(1,n_vertices);
    distance(source) = 0;
    current = source;
    while (sum(visited) < n_vertices)
        % Mark current vertex as visited
        visited(current) = 1;
        % Visit current vertex
        [distance, isUnique] = visit(isUnique, current, edges, n_vertices, visited, distance);
        % Find next current vertex
        current = find_smallestUnvisited(n_vertices, visited, distance);
    end
end

function min = find_smallestUnvisited(n_vertices,visited,distance)
min = 1;
while(min <= n_vertices && visited(min) == 1)
    min = min + 1;
end
if(min > n_vertices)
    return;
end
for i = 1:n_vertices
    if visited(i)==0
        if distance(i) < distance(min)
            min = i;
        end
    end
end
end

function [distanceNew isUniqueNew] = visit(isUnique, current,edges,n_vertices,visited,distance)
    unvisitedNeighbors = [];
    for i=1:n_vertices
        if(edges(current,i) > 0 && visited(i) == 0)
            unvisitedNeighbors = [unvisitedNeighbors i];
        end
    end
    for i=1:length(unvisitedNeighbors)
        newDistance = ...
            distance(current) + edges(current,unvisitedNeighbors(i));
        if(newDistance < distance(unvisitedNeighbors(i)) && distance(unvisitedNeighbors(i))~=Inf)
            isUnique(unvisitedNeighbors(i)) = 0;
        end
        %update add if statement
        if(newDistance < distance(unvisitedNeighbors(i)))
%             isUnique(unvisitedNeighbors(i)) = 1;
            distance(unvisitedNeighbors(i)) = newDistance;
        elseif(newDistance == distance(unvisitedNeighbors(i)))
%             isUnique(unvisitedNeighbors(i)) = 0;
        end
    end
    distanceNew = distance;
    isUniqueNew = isUnique;
end




















