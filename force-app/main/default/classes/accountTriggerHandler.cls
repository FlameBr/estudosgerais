public class accountTriggerHandler {
	public void run()
    {
        if(trigger.IsBefore && trigger.isInsert){
			accountTriggerHelper.preencherDescricao(trigger.new);
        }
		
    }
}