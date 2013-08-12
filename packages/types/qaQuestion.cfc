<cfcomponent extends="farcry.core.packages.types.types" hint="A question asked on the forum." displayname="QA Question" fualias="question" bFriendly="true" bAudit="true">

	<cfproperty
		name="title" type="string" required="no" default=""
		ftseq="1" ftlabel="Question" ftValidation="required" bLabel="true"
		ftfieldset="Question overview" ftWizardStep="QA Question">

</cfcomponent>
