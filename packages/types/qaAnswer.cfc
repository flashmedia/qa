<cfcomponent extends="farcry.core.packages.types.types" hint="A question answered on the forum." displayname="QA Answer" bFriendly="true" bAudit="true">

	<cfproperty
		name="answer" type="longchar" required="no" default=""
		ftseq="10" ftlabel="Answer" bLabel="true"
		ftfieldset="Answer overview" ftWizardStep="QA Answer">

</cfcomponent>
