function res = twodegrees(links, num_vertices)
vertice_list1 = zeros(1,num_vertices);
vertice_list2 = zeros(1,num_vertices);
number_of_edges = length(links);
vertice_degree=zeros(1,num_vertices);
twodegree = zeros(1,num_vertices);

for i = 1:number_of_edges
    vertice_list1 = links(i);
    vertice_list2 = links(i, 2);
    vertice_degree(vertice_list1) = vertice_degree(vertice_list1)+1;
    vertice_degree(vertice_list2) = vertice_degree(vertice_list2)+1;
end
%vertice_degree(vertice_list1) = vertice_degree(vertice_list1)+1;
for j = 1:number_of_edges
    vertice_list1 = links(j);
    vertice_list2 = links(j, 2);
    twodegree(vertice_list1) = twodegree(vertice_list1) + vertice_degree(vertice_list2);
    twodegree(vertice_list2) = twodegree(vertice_list2)+ vertice_degree(vertice_list1);

end
res = twodegree;
%twodegrees(vertice_list1) = twodegrees(vertice_list1) + twodegrees(vertice_list2);
%twodegrees(vertice_list2) = twodegrees(vertice_list2) + twodegrees(vertice_list1);
end

%{
TWO
set both lists equal to zero b/c degree is zero
can use num_edge=length(links) to get number of edges
loop through the number of edges
set vertice list 1 links(loop index)
set vertice list 2 links(loop index + 2)
new var vertice degree(is vertice list 1) equal to vertice degree of vertice list 1 + 1)
vd(v1)=vd(v1)+1
2nd loop j num edges
set vertice list 1 links(loop index)
set vertice list 2 links(loop index, 2)
check each link
two deg(vertice lits 1) = two deg(vertice lits 1) + two deg(vertice lits 2)
two deg(vertice lits 2) = two deg(vertice lits 2) + two deg(vertice lits 1)
return result
%}


% @ cal two degrees of each vertex in the graph
% @ Params:
% @     links: adjacent link of one graph, 
%              m x 2 matrix, graph has m edges
%              each row is to represent an edge
%        
%       num_vertices: number of vertices in the graph
% @ Return: 
% @     res = two degrees of each vertex in the graph
% @ Usage example:
% @    twodegrees(links, num_vertices)
% @ Author: Erkang Cheng
% @ Date: 10/24/2013

%% add your own codes here

%{
1get num vertices with length(...)
2store result in []
3loop through each vertex using num vertices as an index
4nrv = length(cal_reach func call(input edges, loop index))-1;
5if condition:ntv equal to num vertices - 1 then
6result vector equals [result and index]
7show result vector.

%}
%-1 from the number of reachable vertices
%make array to hold result
%loop through vertices to determine what is reachable.call cal reachable
%with length then compare num of recheble vert with num of vertices 
%[result index] 
%show result



 