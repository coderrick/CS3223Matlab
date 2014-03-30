function res = fewest_edges(edges, source)  
%{
if distance(u) + cost(u -> v) == distance(v)
   if numedges(u) + 1 < numedges(v)
      parent(v) = u;
      numedges(v) = numedges(u) + 1;


if distance(u) + cost(u -> v) < distance(v)
   distance(v) = distance(u)
   parent(v) = u;
numedges(v) = numedges(u) + 1;
%}