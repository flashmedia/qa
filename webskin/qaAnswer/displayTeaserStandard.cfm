<cfsetting enablecfoutputonly="true" />

<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="stParam.question" default="#structNew()#" />

<cfset stProfile = structNew() />

    <!--- grab the profile to display --->
    <cftry>

    	<cfif isDefined('session.dmsec.authentication.canonicalname') AND session.dmsec.authentication.canonicalname EQ stObj.createdBy>
            <cfset sBy = 'you' />
            <cfset stUrlParams = { "edit": true, "user": session.dmsec.authentication.objectid, "answer": stObj.objectid } />
    	<cfelse>
    		<cfset stProfile = application.fapi.getContentType('dmProfile').getProfile(stObj.createdBy) />
    	    <cfset sBy = '#stProfile.firstname# #stProfile.lastname#' />
    	</cfif>

    	<cfcatch type="any">
    		<cfdump var="#cfcatch#" />
    		<cfset sBy = stObj.createdBy />
    	</cfcatch>

    </cftry>

<!--- show textarea line breaks into HTML breaks --->
<cfscript>
    // www.cflib.org/udf/paragraphformat2
    answer = stObj.answer;
    answer = replace(answer,chr(13)&chr(10),chr(10),"ALL");
    answer = replace(answer,chr(13),chr(10),"ALL");
    answer = replace(answer,chr(9),"&nbsp;&nbsp;&nbsp;","ALL");
    answer = replace(answer,chr(10),"<br />","ALL");
</cfscript>

<cfoutput>
    <div class="answer">
      <cfif sBy EQ "you">
        <a class="edit" href="#application.fapi.getLink(objectid=stParam.question.objectid,stParameters=stUrlParams)###response">Edit</a>
      </cfif>
      <p class="content">#answer#</p>
      <p class="by">Answered by <span class="user-name">#sBy#</span></p>
      <p class="on">Answered <span>#application.fapi.prettyDate(stObj.datetimecreated, true)#</span></p>
    </div>
</cfoutput>


<cfsetting enablecfoutputonly="false" />
