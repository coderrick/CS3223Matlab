function ccnum = dfs_component(edges)

n = size(edges,1);%finding # of rows (nxn matrix; its size of graph;
global visited; %The value can be accessed from any function.
visited = zeros(1,n);

global connected_component_num_vector;
connected_component_num_vector = zeros(1,n);
global connected_component;
connected_component = 1;%because you start out in the first connected component of the graph.
% call previsit?

for vertices = 1:n
    if(visited(vertices) == 0)
    explore(edges,vertices);
    connected_component = connected_component+1;
    end
end

ccnum = connected_component_num_vector;%return connected components
end

% hint: call dfs and add previst before explore
