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
		name="bActive" type="boolean" required="no" default="true"
		ftseq="15" ftlabel="Is active?" ftValidation="required"
		ftfieldset="Display" ftWizardStep="QA Question" />

	<cfproperty
		name="category" type="string" hint="Topic." required="no" default=""
		ftSeq="16" ftwizardStep="QA Question" ftFieldset="Display" ftLabel="Categories"
		ftType="Category" ftAlias="questions" />

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

	<!--- make a workshopW active --->
	<cffunction name="activate" access="public" output="false" hint="Flags a workshopW as innactive">

		<cfargument name="objectid" required="yes">
		<cfargument name="dsn" required="no" default="#application.dsn#">

		<cfscript>

			stProperties = StructNew();
			stProperties.objectid = arguments.objectid;
			stProperties.bActive = 1;

			this.setData(stProperties=stProperties);

		</cfscript>

	</cffunction>

	<!--- Disable a question --->
	<cffunction name="deActivate" access="public" output="false" hint="Flags a question as innactive">

		<cfargument name="objectid" required="yes" >
		<cfargument name="dsn" required="no" default="#application.dsn#">

		<cfscript>

			stProperties = StructNew();
			stProperties.objectid = arguments.objectid;
			stProperties.bActive = 0;

			this.setData(stProperties=stProperties);

		</cfscript>

	</cffunction>

</cfcomponent>
