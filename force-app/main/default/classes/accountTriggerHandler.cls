/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-27-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
public class AccountTriggerHandler {
	public void run()
    {
        if(trigger.IsBefore && trigger.isInsert){
			AccountTriggerHelper.preencherDescricao(trigger.new);
        }
        if(trigger.IsBefore && trigger.IsUpdate)
        {
            AccountTriggerHelper.verificarMudancaSetor((List<Account>)trigger.new, (Map<Id, Account>)trigger.oldMap);
            AccountTriggerHelper.editadoHaMenosDeUmMin((List<Account>)trigger.new, (Map<Id, Account>)trigger.oldMap);
        }
		if(trigger.IsAfter && trigger.IsInsert)
        {
            AccountTriggerHelper.criarContatoPadrao(trigger.new);
        }
    }
}