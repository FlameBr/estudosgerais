public class AccountTriggerHelper {
	public static void preencherDescricao(List<Account> contas)
    {
		for(Account conta : contas)
        {
			conta.description = 'Conta criada com sucesso.';
		}
	}
}