<cfcomponent extends="farcry.core.packages.types.types" hint="A question answered on the forum." displayname="QA Answer" bFriendly="true" bAudit="true">

	<cfproperty
		name="answer" type="longchar" required="no" default=""
		ftseq="10" ftlabel="Answer" bLabel="true"
		ftfieldset="Answer overview" ftWizardStep="QA Answer">


    <cffunction name="formatAnswer">
      <cfargument name="objectid" required="true">

      <cfscript>
      stAnswer = this.getData(objectid=arguments.objectid);

      answer = stAnswer.answer;
      answer = replace(answer,chr(13)&chr(10),chr(10),"ALL");
      answer = replace(answer,chr(13),chr(10),"ALL");
      answer = replace(answer,chr(9),"&nbsp;&nbsp;&nbsp;","ALL");
      answer = replace(answer,chr(10),"<br />","ALL");

      return answer;
      </cfscript>
    </cffunction>

</cfcomponent>
