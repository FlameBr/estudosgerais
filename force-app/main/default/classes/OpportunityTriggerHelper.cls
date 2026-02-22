public Class OpportunityTriggerHelper
{
	public static void validarValor(List<Opportunity> oportunidades)
    {
		for(Opportunity oportunidade : oportunidades)
        {
			if(oportunidade.StageName == 'Closed Won' && Oportunidade.Amount == NULL)
            {
				oportunidade.addError('A oportunidade não foi valorada, logo não pode ser encerrada como ganha.');
			}
		}
	}


}