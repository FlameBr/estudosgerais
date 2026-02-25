/**
 * @description       : 
 * @author            : flaviomelo.sfdev@gmail.com
 * @group             : 
 * @last modified on  : 02-24-2026
 * @last modified by  : flaviomelo.sfdev@gmail.com
**/
public with sharing class ContactTriggerHelper {
    public static void prevenirEmailDuplicado(List<Contact> contatos)
    {
        set<String> novosEmails = new set<String>();
        set<String> emailExistentes = new set<String>();

        for(Contact contato : contatos)
        {
            if(contato.Email != NULL)
            {
                novosEmails.add(contato.Email);
            }
        }

        if (Schema.sObjectType.Contact.isAccessible()) {
            for (Contact repetido : [
                SELECT Email
                FROM Contact
                WHERE Email IN :novosEmails
                WITH SECURITY_ENFORCED
            ]) {
                emailExistentes.add(repetido.Email);
            }
        } else {
            for (Contact contato : contatos) {
                contato.addError('Sem permissão de leitura em Contato para validação de e-mail.');
            }
            return;
        }

        for(Contact contato : contatos)
        {
            if(emailExistentes.contains(contato.Email))
            {
                contato.addError('Email já cadastrado.');
            }
        }
    }
}
