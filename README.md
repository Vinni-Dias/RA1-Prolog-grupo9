# Sistema Especialista para Recomendação de Trilha Acadêmica

##  Instituição
- PUCPR – Pontifícia Universidade Católica do Paraná  
- Disciplina: Programação Lógica e Funcional 
- Professor: Frank Coelho Alcantara

---

##  Alunos 
- Emmanuel Antonietti Ribeiro dos Santos - [@emmanuelantonietti](https://github.com/emmanuelantonietti).
- Enzo Wasko Amorim - [@enzowasko](https://github.com/enzowasko).
- Juliano Cesar Enns Miranda Marcos - [@juliano2508](https://github.com/juliano2508).
- Vinicius Paraiso Dias – [@vinni-dias](https://github.com/vinni-dias).

---

## Objetivo
Este projeto implementa um **Sistema Especialista em Prolog** para auxiliar estudantes de tecnologia na escolha de uma trilha de especialização acadêmica.  

O sistema funciona por meio de um **questionário dinâmico**, no qual o usuário responde perguntas sobre suas habilidades, afinidades e interesses. Com base nas respostas e em uma **base de conhecimento predefinida**, o sistema recomenda trilhas acadêmicas em ordem de compatibilidade, justificando cada sugestão.  

---

## Estrutura do Projeto

- Ra1_prolog_grupo9.pl -> código fonte (base de conhecimento, motor de inferência, interface do usuário e fluxo de execução)
- Perfil1_prolog_grupo9.pl -> Perfil de teste 1 (lógica e estatística)
- Perfil2_prolog_grupo9.pl -> Perfil de teste 2 (programação e web)
- Perfil3_prolog_grupo9.pl -> Perfil de teste 3 (redes e segurança)
- README.md -> Documentação do projeto

---

## Execução do Programa
Modo Interativo (usuário responde às perguntas)

Iniciar a interação:
?- iniciar.

O sistema fará perguntas (responda com "s." para sim ou "n." para não).
Ao final, será exibida a trilha recomendada em ordem de compatibilidade, junto com a justificativa.

Modo de Teste (com arquivos de perfil)

Executar um perfil de teste:
- ?- testar('Perfil1_prolog_grupo9.pl').
- ?- testar('Perfil2_prolog_grupo9.pl').
- ?- testar('Perfil3_prolog_grupo9.pl').

O sistema exibirá automaticamente a recomendação e a justificativa, sem necessidade de interação.

Uso no SWISH (Prolog Online)

Como o SWISH não suporta consult/1 para carregar arquivos externos:

Cole o conteúdo de um dos perfis (Perfil1_prolog_grupo9.pl, Perfil2_prolog_grupo9.pl ou Perfil3_prolog_grupo9.pl) no final do código.

Em seguida, execute:
- ?- testar('ia').
- ?- testar('web').
- ?- testar('seguranca').

---

## Funcionalidades

- 5 trilhas de especialização predefinidas;

- Questionário dinâmico com perguntas associadas a características;

- Motor de inferência calcula pontuação de aderência;

- Resultados exibidos em ordem de compatibilidade;

- Justificativa clara para cada recomendação;

- 3 arquivos de teste para validação automática.
