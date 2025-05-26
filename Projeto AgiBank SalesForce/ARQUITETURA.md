Documentação do Flow Salesforce: AgiBank Project
a. Arquitetura Usada
O Flow AgiBank Project foi construído na plataforma Salesforce utilizando o recurso de Lightning Flow (Flow Builder), complementado por integrações com Apex. A arquitetura do fluxo segue estes pilares:

Automação Declarativa: O processo de atendimento ao cliente é modelado por meio de telas (screens), decisões (decisions), atribuições (assignments), buscas e gravações de registros (lookups/creates), permitindo orquestrar jornadas complexas sem código, mas com pontos de extensão via Apex.
Integração Apex: Ações Apex (ElegibilidadeOrcamentoHandler, OrderStatusBot) são acionadas para realizar validações e integrações externas, trazendo inteligência e flexibilidade ao fluxo.
Gestão de Dados: O Flow manipula objetos padrão do Salesforce (Contact, Case) e objetos customizados (Historico_de_Navega_o__c), realizando buscas, criações e atualizações com rastreabilidade.
Formulários Dinâmicos: Diversas telas coletam dados do usuário, como dados cadastrais, motivo de contato, informações para simulação de elegibilidade e solicitações de suporte.
Branching e Regras de Negócio: Decisões conduzem o usuário por diferentes caminhos do fluxo, conforme critérios de negócio e respostas do usuário.
Histórico de Navegação: Cada passo relevante é gravado no objeto customizado de histórico, permitindo auditoria e análise posterior.
Feedback Imediato: Telas de confirmação, mensagens de erro e protocolos automatizados melhoram a experiência do usuário.
b. Padrões Aplicados
Separação de Responsabilidades: Lógicas complexas e integrações são tratadas por classes Apex, enquanto a automação declarativa permanece simples e visual.
Nomenclatura Descritiva: Elementos, variáveis e telas possuem nomes que deixam claro seu propósito, facilitando manutenção e entendimento do fluxo.
Uso de Choices e Dropdowns: Minimiza erros de input, padroniza respostas e agiliza o atendimento.
Validação de Campos: Campos obrigatórios e validação em tela garantem a qualidade e integridade dos dados capturados.
Feedback ao Usuário: Mensagens de sucesso, erro e confirmação em diferentes etapas, promovendo clareza e segurança na jornada.
Bulkificação e Eficiência: Integrações Apex são chamadas de forma pontual, evitando sobrecarga e respeitando limites da plataforma.
Documentação dos Passos: O uso do objeto customizado de histórico de navegação registra toda a interação do usuário, importante para compliance e melhoria contínua.
Reaproveitamento: Variáveis, fórmulas e decisões são reutilizadas ao longo do fluxo, reduzindo redundância.
