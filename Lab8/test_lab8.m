%% test script of lab 8
clear;clc;close all

%% 3.9
% use links to represent a graph
% ex. 1st row: 1 4 means there is an edge between node 1 and node 4
% links = [1 4; 1 5; 4 5; 2 3];
% num_vertices = 5;
% disp('****** cal_two_degrees')
% res = cal_two_degrees(links, num_vertices)
% result is 4, 1, 1, 4, 4


%% Q 3.10
%% load graph
G.V = {'A' 'B' 'C', 'D', 'E'};     
G.a = [0 0 0 1 1; 0 0 1 0 0; 0 1 0 0 0; 1 0 0 0 1; 1 0 0 1 0];
% G.a = [0 1 1 0 0; 1 0 0 1 0; 1 0 0 0 1; 0 1 0 0 0; 0 0 1 0 0];
edges = G.a;


%% test cal_reachable_vertices
disp('****** cal_reachable_vertices')

res = cal_reachable_vertices(edges, 1)
% result is 1, 4,5

%% test dfs
disp('****** dfs')
res = dfs(edges)
% result is 1, 4, 5, 2, 3

%% test dfs_timings
disp('****** dfs_timings')
[pre post] = dfs_timings(edges)
% result :
% pre:  1 7  8  2 3
% post: 6 10 9  5 4


%% Q 3.22
% hint cal cal_reachable_vertices for each vertex, and count the times one
% vertex can be reached by another vertex
% if the times one vertex can be reached by another vertices is n-1
% then means this vertex can be reached by all other vertices
res = find_reachable_vertices_from_others(edges)


%% Q 3.7

%% test bfs
G.a = [0 1 1 0 0; 1 0 0 1 0; 1 0 0 0 1; 0 1 0 0 0; 0 0 1 0 0];
edges = G.a;
disp('****** bfs')
res = bfs(edges)
% result is 1, 2, 3, 4, 5
disp('****** dfs')
res = dfs(edges)

disp('****** determine_bipartite')
res = determine_bipartite(edges)
