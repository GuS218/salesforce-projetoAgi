public with sharing class ElegibilidadeOrcamentoHandler {
    @InvocableMethod(label='Avalia Elegibilidade e Orçamento')
    public static List<RespostaBot> avalia(List<Solicitacao> inputs) {
        List<RespostaBot> respostas = new List<RespostaBot>();
        for (Solicitacao input : inputs) {
            RespostaBot out = new RespostaBot();
            Integer score = 0;

            // 1 ponto se idade informada, +2 se maior de 21, +1 se maior de 18
            if (input.idade != null) {
                score += 1;
                if (input.idade >= 21) score += 2;
                else if (input.idade >= 18) score += 1;
            }

            // 3 pontos se renda >= 4000, 1 ponto se >= 2000
            if (input.rendaMensal != null) {
                if (input.rendaMensal >= 4000) score += 3;
                else if (input.rendaMensal >= 2000) score += 1;
            }

            // 3 pontos se NÃO possui restrição no nome
            if (input.possuiRestricao != null && !input.possuiRestricao) {
                score += 3;
            }

            // 1 ponto se NÃO é cliente ainda
            if (input.eCliente != null && !input.eCliente) {
                score += 1;
            }

            // Garantir máximo de 10 pontos
            if (score > 10) score = 10;

            // Mensagem do bot conforme o score
            if (input.idade == null || input.rendaMensal == null) {
                out.respostaBot1 = 'Idade ou renda não informada.';
                out.respostaBot2 = '';
            } else if (input.idade < 18) {
                out.respostaBot1 = 'Não elegível: menor de idade.';
                out.respostaBot2 = '';
            } else if (score >= 6) {
                Decimal orcamento = input.rendaMensal * 6;
                if (orcamento < 10000) orcamento = 10000;
                if (orcamento > 50000) orcamento = 50000;
                out.respostaBot1 = 'Simulação realizada com sucesso! ' +
                                   'Com sua renda mensal de R$ ' + String.valueOf(input.rendaMensal.setScale(2)) +
                                   ', você pode contratar um empréstimo de até R$ ' + String.valueOf(orcamento.setScale(2)) +
                                   ', com parcelas entre 24 e 48 meses. ' +
                                   'O valor mínimo para contratação é de R$ 10.000,00 e o valor máximo é de R$ 50.000,00. ' +
                                   'Consulte as condições e taxas antes de prosseguir.';

                // Texto simulação de empréstimo (exemplo de 24x a 48x)
                out.respostaBot2 = 'Prezado cliente,\n\n' +
    'Com base em sua renda mensal de R$ ' + String.valueOf(input.rendaMensal.setScale(2)) + ', ' +
    'informamos que seu orçamento pré-aprovado para empréstimo é de até R$ ' + String.valueOf(orcamento.setScale(2)) + '.\n\n' +
    'Condições da simulação:\n' +
    '- Valor mínimo para contratação: R$ 10.000,00\n' +
    '- Valor máximo para contratação: R$ 50.000,00\n' +
    '- Prazo para pagamento: entre 24 e 48 meses\n\n' +
    'A aprovação final está sujeita à análise de crédito e demais condições da instituição. ' +
    'Para mais detalhes sobre taxas, condições ou para avançar com a contratação, entre em contato conosco.';
            } else {
                out.respostaBot1 = 'Não elegível para orçamento. Score de elegibilidade: ' + score + ' de 10.';
                out.respostaBot2 = '';
            }

            out.score = score;
            respostas.add(out);
        }
        return respostas;
    }

    public class Solicitacao {
        @InvocableVariable(label='Idade')
        public Integer idade;

        @InvocableVariable(label='Já é Cliente')
        public Boolean eCliente;

        @InvocableVariable(label='Possui Restrição no Nome')
        public Boolean possuiRestricao;

        @InvocableVariable(label='Renda Mensal')
        public Decimal rendaMensal;
    }

    public class RespostaBot {
        @InvocableVariable(label='Resposta Bot')
        public String respostaBot1;

        @InvocableVariable(label='Score Elegibilidade')
        public Integer score;

        @InvocableVariable(label='Resumo Simulação')
        public String respostaBot2;
    }
}