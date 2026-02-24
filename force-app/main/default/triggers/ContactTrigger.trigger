/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-23-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
    ContactTriggerHandler handler = new ContactTriggerHandler();
    handler.run();
}