%Input: edges which is an adjacency matrix to represent a graph
%Output: display tells you whether or not all vertices can be reached.
%followed by the results vector containing the reachable vertices.
function results = reachable_vertices(edges)
num_vertices = length(edges);
results = [];
for i = 1:num_vertices%loop through each vertex using num vertices as an index
    
    % results if we start from vertex i
    first_component = cal_reachable_vertices(edges, i);
    results = [results first_component];%514
end  
str1 = ['All vertices are reachable, results for reachable_vertices: ', num2str(first_component)];
str2 = ['Not all vertices are reachable, results for reachable_vertices: ', num2str(first_component)];    
 if (length(first_component)== num_vertices)
    disp(str1);
 else    
    disp(str2);
 end
 results = first_component;
end
