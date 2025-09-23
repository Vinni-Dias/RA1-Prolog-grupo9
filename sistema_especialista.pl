:- dynamic resposta/2.


iniciar :-
    writeln('=== Sistema Especialista de Trilhas Acadêmicas ==='),
    retractall(resposta(_,_)),
    faz_perguntas,
    recomenda(Ordenadas),
    exibe_resultado(Ordenadas).


faz_perguntas :-
    forall(pergunta(_, Texto, Caracteristica),
        (
            format('~w (s/n): ', [Texto]),
            read(Resp),
            (Resp == s ; Resp == n),
            assertz(resposta(Caracteristica, Resp))
        )).


exibe_resultado([(Trilha, P)|Resto]) :-
    trilha(Trilha, Desc),
    format('Trilha: ~w (~w pontos) - ~w~n', [Trilha, P, Desc]),
    writeln('Justificativa:'),
    forall(perfil(Trilha, Caracteristica, Peso),
        (resposta(Caracteristica, s) ->
            format('  ✔ Afinidade com ~w (+~w pontos)~n', [Caracteristica, Peso])
        ; true)),
    writeln(''),
    exibe_resultado(Resto).
exibe_resultado([]).