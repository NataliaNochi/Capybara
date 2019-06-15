#language:pt

@login
Funcionalidade: Remover Filmes
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título indesejado
    Posso remover este item 

    @rm_movie
    Cenário: Excluir filme
        Dado que "dbz" faz parte do catálogo 
        Quando eu solicito a exclusão
        E confirmo a solicitação
        Então este item deve ser removido do catálogo

    @cancela_remocao
    Cenário: Cancelar exclusão
        Dado que "10_coisas" faz parte do catálogo 
        Quando eu solicito a exclusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálogo