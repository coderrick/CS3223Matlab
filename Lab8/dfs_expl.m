function res = dfs_expl(edges)
n = size(edges,1);%finding # of rows (nxn matrix; its size of graph;
global visited; %The value can be accessed from any function.
visited = zeros(1,n);
global res_vec;%declared global variable
res_vec = [];% set it to empty vector that will be populated with answer

for vertices = 1:n
    if (visited(vertices) == 0)
    expl(edges,vertices);
    end
      
end

res = res_vec;
