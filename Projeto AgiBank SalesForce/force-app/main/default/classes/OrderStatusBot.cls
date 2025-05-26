public with sharing class OrderStatusBot {
    public class OrderInput {
        @InvocableVariable(required=true)
        public String orderNumber;
        @InvocableVariable(required=true)
        public String email; // Receberá o email do contato
    }

    public class OrderOutput {
        @InvocableVariable
        public String respostaBot1;
    }

    @InvocableMethod(label='Consultar Status do Pedido por Email')
    public static List<OrderOutput> consultarStatusPedido(List<OrderInput> pedidos) {
        List<OrderOutput> respostas = new List<OrderOutput>();

        // Coleta todos os emails informados
        Set<String> emails = new Set<String>();
        for (OrderInput pedido : pedidos) {
            emails.add(pedido.email);
        }

        // Busca os contatos correspondentes aos emails
        Map<String, Contact> contatos = new Map<String, Contact>();
        for (Contact c : [SELECT FirstName, LastName, Email FROM Contact WHERE Email IN :emails]) {
            contatos.put(c.Email, c);
        }

        for (OrderInput pedido : pedidos) {
            Contact c = contatos.get(pedido.email);
            String cliente = (c != null) ? c.FirstName + ' ' + c.LastName : 'Cliente não encontrado';
            String dataPedido = '24/05/2025';
            String produto = 'Notebook Dell Inspiron 15';
            String status = 'Em trânsito';
            String previsaoEntrega = '28/05/2025';

            OrderOutput out = new OrderOutput();
            out.respostaBot1 = 'Olá, ' + cliente +
                '! O pedido número ' + pedido.orderNumber +
                ' realizado em ' + dataPedido +
                ' para o produto "' + produto +
                '" está atualmente com o status: ' + status +
                '. A previsão de entrega é ' + previsaoEntrega + '.';
            respostas.add(out);
        }
        return respostas;
    }
}