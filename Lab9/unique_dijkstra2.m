% NOTE: isUnique now contains 0's if unique, not 1's
function [distance isUnique] = dijkstra(edges,source)
    n_vertices = size(edges,1);
    visited = zeros(1,n_vertices);
    isUnique = zeros(1,n_vertices);
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
        if(newDistance < distance(unvisitedNeighbors(i)))
            isUnique(unvisitedNeighbors(i)) = 0;
            distance(unvisitedNeighbors(i)) = newDistance;
        elseif(newDistance == distance(unvisitedNeighbors(i)))
            isUnique(unvisitedNeighbors(i)) = 1;
        end
    end
    distanceNew = distance;
    isUniqueNew = isUnique;
end




















%{
function res = dijkstra(edges, source, destination)
n = size(edges, 1);
           %Initializations
           global distance;
           distance = Inf(1,n);                         % Mark distances from source to v as not yet computed
           global visited;
           visited = zeros(1,n);                            % Mark all nodes as unvisited
           global previous;
           previous = NaN(1,n);                        % Previous node in optimal path from source
           global res_vec;
           res_vec = [];
for i=1:n
    % distance(i) = 0;
     if (visited(i) == 0)
         explore(edges, 1);
     end  
end
 res = distance;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function explore(edges, idx_start)


% hint: implement a non-recursive function "explore" breadth-first-search

%% declare global variables and do not intialize them agian
% only set values for them
global distance;
global visited;
global previous;
global res_vec;

%%
n = size(edges, 1);

distance(idx_start) = 0;
Q = [];
D = [];

Q = [Q idx_start]; % push start vertex into S
D = [D 0];
visited(idx_start) = 1;
res_vec = [res_vec idx_start];
while ( ~isempty(Q) ) % while S is not empty
    %go through Q, find the one with the smallest distance as u
    u = Q(1);
    str = ['---- bfs: We are visiting node ', num2str(u)];
    disp(str);
    
    % eject Q
    %if shortes distance pop
    Q(1) = [];
    
    for v = 1:n
        if (edges(u, v)==1) % there is an edge
            if (visited(v) == 0 && distance(v) == Inf)%use && of || ?
                % inject v into Q
                visited(v) = 1;
                res_vec = [res_vec v];
                Q = [Q v];
                distance(v) = distance(u) + 1;
            end
        end
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       dist[source]  := 0;                                   % Distance from source to itself is zero
       insert source into Q;                                 % Start off with the source node
                                                                
      while Q is not empty:                                  % The main loop
          u := vertex in Q with smallest distance in dist[] and has not been visited;  % Source node in first case
          remove u from Q;
          visited[u] := true                                 % mark this node as visited
          
          for each neighbor v of u:   
              alt := dist[u] + dist_between(u, v);           % accumulate shortest dist from source
              if alt < dist[v] && !visited[v]:                                 
                  dist[v]  := alt;                           % keep the shortest dist from src to v
                  previous[v]  := u;
                  insert v into Q;                           % Add unvisited v into the Q to be processed
              end if
          end for
      end while
      res = distance;
%{
%% number of nodes in the graph
n = size(edges, 1);

global distance;
distance = Inf;%Set all nodes to Infinity 
global prev;
prev = NaN;

global visited;%do I still need visited?
visited = zeros(1, n);

global res_vec;
res_vec = [];
%}
%{
Should I use explore like bfs?
how do I modify explore to recognize the weighted edges?
How should I structure the algorithm?
%}
%}