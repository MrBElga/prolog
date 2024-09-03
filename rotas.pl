busca([Elem|_], 1, Elem).
busca([_|Cauda], Pos, Elem):- busca(Cauda,PAux, Elem),

concatena([],L2,L2).
concatena([C|Cauda],L2,[C|LAux]):- concatena(Cauda,L2,LAux).

remove([Elem|Cauda], Elem, Cauda).
remove([C|Cauda],Elem, [C|LAux] ):- remove(Cauda, Elem, LAux).

removetodos([],_,[]).
removetodos([Elem|Cauda], Elem, LAux):-removetodos(Cauda,Elem,LAux).
removetodos([C|Cauda],Elem, [C|LAux] ):- removetodos(Cauda, Elem, LAux).

insere(L,Elem,NL) :- remove(NL, Elem, L).

%rotas
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

pode_ir(X,Y) :- liga(X,Y) ; liga(Y,X).

busca(X,Y) :- liga(X,Y).
busca(X,Y) :- liga(X,Z), busca(Z,Y).

busca2(X, Y, [X,Y]):- liga(X,Y).
busca2(X, Y, Cam) :- liga(X,Z), busca2(Z,Y,CAux), Cam = [X|CAux].

dfs(Origem, Destino, Cam) :-  rota(Origem, Destino, [Origem], Cam).

rota(X,X,Cam,Cam).
rota(Origem, Destino, Visitados, Cam):-
    pode_ir(Origem, V),
    not(member(V,Visitados)),
    rota(V,Destino,[V|Visitados],Cam).

