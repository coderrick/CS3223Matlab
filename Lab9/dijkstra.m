function distance = dijkstra(edges,source)
    n_vertices = size(edges,1);
    visited = zeros(1,n_vertices);
    distance = Inf(1,n_vertices);
    distance(source) = 0;
    current = source;
    previous = zeros(1,n_vertices);
    
    while (sum(visited) < n_vertices)%adds up all trues to comp with num v if equal then stop
        % Mark current vertex as visited
        visited(current) = 1;
        % Visit current vertex
%         distance = visit(current, edges, n_vertices, visited, distance, previous);%will find shortest path to all nodes
        [distance, previous] = visit(current, edges, n_vertices, visited, distance, previous);%will find shortest path to all nodes
        % Find next current vertex
        current = find_smallestUnvisited(n_vertices, visited, distance);%looks for unvisited node with the smallest weight to visit next
        
    end
    
    previous
end

function min = find_smallestUnvisited(n_vertices,visited,distance)
    min = 1;
    while(min <= n_vertices && visited(min) == 1)%incrementing min until unvisited node is found
        min = min + 1;
    end
    if(min > n_vertices)
        return;
    end
    %look for node with unvisited value to that has the lowest value from source
    for i = 1:n_vertices
        if visited(i)==0
            if distance(i) < distance(min)
                min = i;
            end
        end
    end
end

function [distanceNew newPrevious] = visit(current,edges,n_vertices,visited,distance,previous)
    unvisitedNeighbors = [];
    for i=1:n_vertices
        if(edges(current,i) > 0 && visited(i) == 0)
            unvisitedNeighbors = [unvisitedNeighbors i];
          
        end
    end
    for i=1:length(unvisitedNeighbors)
        newDistance = distance(current) + edges(current,unvisitedNeighbors(i));%finds new distance
        if(newDistance < distance(unvisitedNeighbors(i)))%checks if shorter
            distance(unvisitedNeighbors(i)) = newDistance;%assigns new distance
            previous(unvisitedNeighbors(i)) = current;
        end
    end
    newPrevious=previous;
    distanceNew = distance;
end




















