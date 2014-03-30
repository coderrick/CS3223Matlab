%Input: G = (E,V); a graph with vertices V and edges E
%Output: A set of all reachable nodes

function explore(edges, idx_start)
global visited;
global result_vector;
global previsit_vector;% will contain solution set for previsit
global postvisit_vector;%will contain solution set for postvisit
global clock;%counter to update pre and post vector indexes
global connected_component_num_vector;
global connected_component;


%%
n = size(edges, 1);%getting size of the matrix

visited(idx_start) = 1;%setting initial node to visited
result_vector = [result_vector, idx_start];%adding visited node to vector

%{
previsit(v)
pre[v] = clock
clock = clock + 1
%}
%connected_component = connected_component + 1;
previsit_vector(idx_start) = clock;
clock = clock + 1 ;
str = ['---- previsit: We are exploring node ', num2str(idx_start)];
disp(str);
 
for idx_neighbor = 1:n
    
    if (edges(idx_start, idx_neighbor)==1) % there is an edge
        
        if (visited(idx_neighbor) == 0)
            explore(edges, idx_neighbor);
            
        end      
        connected_component_num_vector(idx_neighbor) = connected_component;
    end 
end
postvisit_vector(idx_start) = clock;  
clock = clock + 1;
%{
postvisit(v)
post[v] = clock
clock = clock + 1
%}
str = ['**** postvisit We finish exploring node ', num2str(idx_start)];
disp(str); 
%str = [' edges is ', edges ];
%disp(str);
end
