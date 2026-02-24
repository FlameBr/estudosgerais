/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-23-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
public with sharing class ContactTriggerHelper {
    public static void prevenirEmailDuplicado(List<Contact> contatos)
    {
        List<String> novosEmails = new List<String>();
        List<Contact> novosContatos = new List<Contact>();

        for(Contact novo : contatos)
        {
            novosEmails.add(novo.Email);
        }
        List<Contact> contatosPrevios = [SELECT Email FROM Contact where Email in : novosEmails];
        for(Contact contato : contatos){
            Boolean emailDuplicado = false;
            for(Contact contatoPrevio : contatosPrevios)
            {
                if(contato.Email == contatoPrevio.Email)
                {
                    contato.addError('email já cadastrado');
                    emailDuplicado = true;
                } else {
                    emailDuplicado = false;
                }
            }
            if(emailDuplicado == false)
            {
                novosContatos.add(contato);
            }
        }

        Database.SaveResult[] result = Database.insert(novosContatos, false, AccessLevel.USER_MODE);
    }
}