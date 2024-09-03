homem(norberto).
homem(pierre).
homem(bruno).

mulher(berta).
mulher(ursula).

bonito(ursula).
bonito(norberto).
bonito(pierre).

rico(norberto).
rico(berta).

amavel(bruno).

forte(berta).
forte(pierre).
forte(bruno).

%predicado Todos os homens gostam de mulheres bonitas
gosta(X,Y) :- homem(X), mulher(Y), bonito(Y).

% Todos os homens ricos são felizes
feliz(X) :- homem(X), rico(X).

% Qualquer homem que gosta de uma mulher ques gosta dele é feliz.
feliz(X) :- homem(X), mulher(Y),gosta(X,Y), gosta(Y,X).

% predicado para mulher
feliz(Y) :- homem(X), mulher(Y),gosta(X,Y), gosta(Y,X).

%regra da ursula
gosta(X,Y) :- X=ursula, homem(Y),forte(Y), amavel(Y), rico(Y), bonito(Y), gosta(Y,X).

%regra da berta
gosta(X,Y) :- X=berta, homem(Y), gosta(Y,X).


