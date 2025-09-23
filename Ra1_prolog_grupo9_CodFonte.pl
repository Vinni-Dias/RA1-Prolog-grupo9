% apenas colocar a linha a seguir se o código estiver separado. %
:- [base_conhecimento].

:- dynamic resposta/2.


calcula_pontuacao(Trilha, Caracteristica, Pontuacao) :-
    perfil(Trilha, Caracteristica, Peso),
    (resposta(Caracteristica, s) -> Pontuacao is Peso ; Pontuacao is 0).


pontuacao_trilha(Trilha, Total) :-
    findall(P,
        calcula_pontuacao(Trilha, _, P),
        Lista),
    sum_list(Lista, Total).


recomenda(Ordenadas) :-
    findall((Trilha, P),
        (trilha(Trilha, _), pontuacao_trilha(Trilha, P)),
        Resultado),
    sort(2, @>=, Resultado, Ordenadas).



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


testar(Perfil) :-
    writeln('--- Iniciando teste para o perfil: '),
    writeln(Perfil),
    writeln('---'),

    retractall(resposta(_, _)),
    respostas_perfil(Perfil),

    recomenda(Ordenadas),
    exibe_resultado(Ordenadas),

    writeln('--- Teste concluído.').