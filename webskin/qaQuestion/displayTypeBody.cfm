<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfset stLocal.qQuestions = application.fapi.getContentObjects(typename="qaQuestion",orderBy="datetimecreated") />
 
<cfoutput>
	<div class="header">
		<h1 class="main">Questions</h1>
		<button type="button" class="askButton" data-href="#application.fapi.getLink(alias='qa-ask')#">Ask A Question</button>
	</div>
	<div class="questions">
</cfoutput>
 
<cfloop query="stLocal.qQuestions">
  <skin:view typename="qaQuestion" objectid="#stlocal.qQuestions.objectid#" webskin="displayTeaserStandard" />
</cfloop>

<cfoutput></div></cfoutput>
 
<cfsetting enablecfoutputonly="false" />