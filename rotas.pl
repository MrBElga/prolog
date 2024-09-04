
% rotas posssiveis
liga(pprudente,marilia,179).
liga(pprudente,assis,127).
liga(marilia,bauru,103).
liga(marilia,assis,75).
liga(bauru,saocarlos,155).
liga(assis,ourinhos,75).
liga(ourinhos,bauru,119).
liga(ourinhos,spaulo,337).
liga(ourinhos,sorocaba,291).
liga(sorocaba,spaulo,100).
liga(saocarlos,campinas,141).
liga(campinas,spaulo,98).
liga(spaulo,santos,71).

pode_ir(X, Y, Dist) :- liga(X, Y, Dist). % rgra de ligação se pode ou n ir
pode_ir(X, Y, Dist) :- liga(Y, X, Dist).


busca(X,Y) :- liga(X,Y).
busca(X,Y) :- liga(X,Z), busca(Z,Y).

busca2(X, Y, [X,Y]):- liga(X,Y).
busca2(X, Y, Cam) :- liga(X,Z), busca2(Z,Y,CAux), Cam = [X|CAux].

dfs(X, Y, Cam, DistTot) :- 
    rota(X, Y, [X], Cam, DistTot).


rota(X, X, Cam, Cam, 0).
rota(X, Y, Visitados, Cam, DistTot) :-
    pode_ir(X, Z, Dist),
    not(member(Z, Visitados)),
    rota(Z, Y, [Z|Visitados], Cam, DistAux),
    DistTot is Dist + DistAux.

menor_rota(X, Y, MelhorCam, MenorDist) :-
    findall([Cam, Dist], dfs(X, Y, Cam, Dist), Rotas), %o findall para pegar tds da list
    menor_distancia(Rotas, [MelhorCam, MenorDist]).

menor_distancia([Rota], Rota). % achando o q tem a mnr rota
menor_distancia([[Cam, Dist] | Restantes], [MelhorCam, MenorDist]) :-
    menor_distancia(Restantes, [CamAux, DistAux]),
    (Dist < DistAux -> (MelhorCam = Cam, MenorDist = Dist) ;
    (MelhorCam = CamAux, MenorDist = DistAux)).

%consultas feitas
%menor_rota(pprudente, santos, MelhorCam, MenorDist).
%%menor_rota(pprudente, spaulo, MelhorCam, MenorDist).
%menor_rota(pprudente, marilia, MelhorCam, MenorDist).
%findall([Cam, Dist], dfs(pprudente, spaulo, Cam, Dist), Rotas).
