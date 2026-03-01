/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-28-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
public without sharing class AccountTriggerHelper{
	public static void preencherDescricao(List<Account> contas)
    {
		for(Account conta : contas)
        {
			conta.description = 'Conta criada com sucesso.';
		}
	}

	public static void verificarMudancaSetor(List<Account> contas, Map<Id, Account> contasAntes)
	{
		for(Account conta : contas)
		{
			Account anterior = contasAntes.get(conta.Id);
			if(conta.Industry != anterior.Industry && conta.Industry == 'Technology')
			{
				conta.Rating = 'Hot';
			}
		}
	}

	public static void criarContatoPadrao(List<Account> contas)
	{
		List<Contact> contatosParaInserir = new List<Contact>();
		for (Account conta : contas) {
			Contact novoContato = new Contact();
			novoContato.LastName = 'Contato padrão ' + conta.Name;
			novoContato.AccountId = conta.Id;
			contatosParaInserir.add(novoContato);
		}

		if(!contatosParaInserir.isEmpty())
		{
			Database.SaveResult[] results = Database.insert(contatosParaInserir, false, AccessLevel.USER_MODE);
			System.debug('Utilização de DML: ' + Limits.getLimitDmlStatements() + ' de ' + Limits.getLimitDmlStatements());
		}
	}

	public static void editadoHaMenosDeUmMin(List<Account> contas, Map<Id,Account> contasAntes)
	{
		System.debug('entrou na classe');
		for(Account conta : contas)
		{
			Account anterior = contasAntes.get(conta.Id);
			System.debug('hora da edição: ' + anterior.LastModifiedDate.minute() + ' hora atual: ' + System.now().minute());
			if(anterior.LastModifiedDate.minute() < System.now().minute() - 2)
			{
				System.debug('Essa porra chegou aqui.');
				conta.addError('Está conta foi modificada há menos de 1 minuto.');
			}
			
		}
	}
}