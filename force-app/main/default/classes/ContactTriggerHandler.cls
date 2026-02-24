/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-23-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
public with sharing class ContactTriggerHandler {
    public void run()
    {
        if(trigger.Isbefore && (trigger.IsInsert || trigger.IsUpdate))
        {
            ContactTriggerHelper.prevenirEmailDuplicado(trigger.new);
        }
    }
}