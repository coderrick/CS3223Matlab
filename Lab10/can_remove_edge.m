%{
function res = edge_removable(edges)
global visited; %The value can be accessed from any function.
visited = zeros(1,n);
global clock;
clock = 1;
global previsit_vector;
previsit_vector = zeros(1,n);
global postvisit_vector;
postvisit_vector = zeros(1,n);
global res_vec;%declared global variable
res_vec = [];% set it to empty vector that will be populated with answer

for vertices = 1:n
    if (visited(vertices) == 0)
    expl(edges,vertices);
    end     
end
%edges greater than or equal to the size
fin_vertices = length(res_vec);
    if(n >= fin_vertices)
    res = true;
    else
    res = false;
    end
%}


function res = can_remove_edge(G)
    len = size(G, 1);
    
    global visited;
    visited = zeros(1, len);
    
    global circuit;
    circuit = 0;
    
    %for loop through the vertices
    for i = 1:len
        if visited(i) == 0
            explore(G, i);
        end
    end
    
    res = circuit;
end

function explore(G, v)
    len = size(G, 1);
    
    global visited;
    visited(v) = 1;
    
    global circuit;

    for i = 1:len
        if (G(v, i)==1)
            if (visited(i) == 0)
                explore(G, i);
            elseif visited < 4
                visited = visited+1;
            else
                circuit = 1;
            end
        end
    end
end
