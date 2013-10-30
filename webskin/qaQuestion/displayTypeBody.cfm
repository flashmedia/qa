<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfset stLocal.qQuestionsRecent = application.fapi.getContentObjects(typename="qaQuestion",lProperties='objectid',orderBy="datetimecreated DESC") />

<cfquery name="stLocal.qQuestionsPopular" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID, count(DISTINCT qaquestion_aviews.data) as viewcount, count(DISTINCT qaquestion_aanswers.data) as answercount
	FROM qaQuestion
	LEFT JOIN qaquestion_aanswers ON qaquestion_aanswers.parentid = qaQuestion.ObjectID
	LEFT JOIN qaquestion_aviews ON qaquestion_aviews.parentid = qaQuestion.ObjectID
	GROUP BY qaQuestion.ObjectID
	ORDER BY viewcount DESC, answercount DESC, qaQuestion.datetimecreated DESC
</cfquery>
 
<cfoutput>
	
	<div class="banner">
		<h1>Ask A Mechanic</h1>
		<button type="button" class="askButton" data-href="#application.fapi.getLink(alias='qa-ask')#">Ask A Question</button>
	</div>
	
	<div class="tabs">
		<ul>
			<li class="selected" data-type="recent">Recent</li>
			<li data-type="popular">Popular</li>
		</ul>
	</div>
</cfoutput>
 
<cfoutput><div class="questions" data-type="recent"></cfoutput>
<cfloop query="stLocal.qQuestionsRecent">
  <skin:view typename="qaQuestion" objectid="#stlocal.qQuestionsRecent.objectid#" webskin="displayTeaserStandard" />
</cfloop>
<cfoutput></div></cfoutput>
	
<cfoutput><div class="questions hide" data-type="popular"></cfoutput>
<cfloop query="stLocal.qQuestionsPopular">
  <skin:view typename="qaQuestion" objectid="#stlocal.qQuestionsPopular.objectid#" webskin="displayTeaserStandard" />
</cfloop>
<cfoutput></div></cfoutput>
	
 
<cfsetting enablecfoutputonly="false" />