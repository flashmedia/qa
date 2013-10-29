<cfcomponent extends="farcry.core.packages.types.types" hint="Records a view for a particular question." displayname="QA View">

	<cfproperty
		name="title" type="string" required="no" default=""
		ftseq="1" ftlabel="Title" bLabel="true"
		ftfieldset="View overview" ftWizardStep="Question view" />
		
	<cfproperty
		name="ip" type="string" required="no" default=""
		ftseq="10" ftlabel="IP Address"
		ftfieldset="View detail" ftWizardStep="Question view" />
		
	<cfproperty
		name="userAgent" type="string" required="no" default=""
		ftseq="20" ftlabel="User Agent"
		ftfieldset="View detail" ftWizardStep="Question view" />

</cfcomponent>
