/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-25-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
trigger LeadTrigger on Lead (before insert, before update, after insert, after update, after delete, after undelete) {
    LeadTriggerHandler handler = new LeadTriggerHandler();
    handler.run();
}