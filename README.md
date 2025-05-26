# Projeto AgiBank Salesforce

Este repositório contém os metadados do projeto Salesforce para o AgiBank, incluindo:
- Código Apex (classes)
- Flows
- Objetos customizados

## Estrutura de Pastas

```
force-app/main/default/
├── classes/
│   ├── OrderStatusBot.cls
│   └── ElegibilidadeOrcamentoHandler.cls
├── flows/
│   └── AgiBank_Project.flow
└── objects/
    └── Historico_de_Navega_o__c.object
```

## Pré-requisitos

- [Salesforce CLI (sfdx)](https://developer.salesforce.com/tools/sfdxcli)
- Acesso a uma org Salesforce (Developer Edition, Sandbox ou Production)
- Permissão para fazer deploy de metadados na org

## Como rodar o projeto (Deploy para uma org Salesforce)

1. **Clone este repositório:**
   ```sh
   git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   cd SEU_REPOSITORIO
   ```

2. **Faça login na sua org Salesforce usando o Salesforce CLI:**
   ```sh
   sfdx force:auth:web:login -a minhaOrg
   ```
   > Isso irá abrir uma janela no navegador para você autenticar.  
   > O parâmetro `-a minhaOrg` define um alias (apelido) para a org.

3. **Faça o deploy dos metadados para sua org:**
   ```sh
   sfdx force:source:deploy -p force-app -u minhaOrg
   ```
   > Se não usar alias, remova o `-u minhaOrg`.

4. **Verifique o deploy:**
   - Acesse sua org Salesforce.
   - Confirme se os objetos, flows e classes Apex foram criados.

## Observações

- Mantenha o repositório atualizado para facilitar versionamento e deploy entre ambientes.
- Sempre que adicionar ou alterar metadados, faça commit e push para o GitHub.
- O arquivo `.gitignore` garante que arquivos e pastas temporárias não sejam enviados para o repositório.

---

Se precisar de mais instruções, consulte a [documentação oficial do Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/).