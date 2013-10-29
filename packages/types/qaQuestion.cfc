<cfcomponent extends="farcry.core.packages.types.types" hint="A question asked on the forum." displayname="QA Question" fualias="question" bFriendly="true" bAudit="true">

	<cfproperty
		name="title" type="string" required="no" default=""
		ftseq="1" ftlabel="Question" ftValidation="required" bLabel="true"
		ftfieldset="Question overview" ftWizardStep="QA Question" />

	<cfproperty
		name="description" type="longchar" required="no" default=""
		ftseq="10" ftlabel="Description"
		ftfieldset="Question overview" ftWizardStep="QA Question" />
		
	<cfproperty
		name="aViews" type="array" required="no"
		ftType="array" ftJoin="qaView" />

	<cfproperty
		name="aAnswers" type="array" required="no"
		ftseq="20" ftLabel="Answers" ftType="array" ftJoin="qaAnswer"
		ftfieldset="Question answers" ftWizardStep="QA Answers" />
	
	<cffunction name="registerView" returntype="Struct">
	
		<cfargument name="qaQuestion" type="struct" required="true" />
		<cfargument name="userAgent" type="string" required="true" />
		<cfargument name="ip" type="string" required="true" />
		
		<cfscript>
			oView = StructNew();
			oView.userAgent = arguments.userAgent;
			oView.ip = arguments.ip;
			oView.parentid = qaQuestion.objectid;
			
			stViewResult = application.fapi.getContentType('qaView').createData(oView);
			
			// save the new view record against this objects aView property
			stProps = StructNew();
			stProps.objectid = arguments.qaQuestion.objectid;
			stProps.aViews = arguments.qaQuestion.aViews;
			ArrayAppend(stProps.aViews, stViewResult.objectid);
			
			stPropsResult = application.fapi.getContentType('qaQuestion').setData(stProps);	
		</cfscript>
		
		<cfreturn stPropsResult />
		
	</cffunction>

</cfcomponent>
