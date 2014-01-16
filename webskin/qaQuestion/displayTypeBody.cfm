<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfset stLocal.qQuestionsRecent = application.fapi.getContentObjects(typename="qaQuestion",lProperties='objectid',orderBy="datetimecreated DESC") />

<cfquery name="stLocal.qQuestionsPopular" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID, count(DISTINCT qaQuestion_aViews.data) as viewcount, count(DISTINCT qaQuestion_aAnswers.data) as answercount
	FROM qaQuestion
	LEFT JOIN qaQuestion_aAnswers ON qaQuestion_aAnswers.parentid = qaQuestion.ObjectID
	LEFT JOIN qaQuestion_aViews ON qaQuestion_aViews.parentid = qaQuestion.ObjectID
	GROUP BY qaQuestion.ObjectID
	ORDER BY viewcount DESC, answercount DESC, qaQuestion.datetimecreated DESC
</cfquery>
 
<cfoutput>

	<div class="tabs">
		<ul class="nav nav-tabs">
			<li class="active" data-type="recent"><a href="##">Recent</a></li>
			<li data-type="popular"><a href="##">Popular</a></li>
			<li data-type="question" class="pull-right"><a href="#application.fapi.getLink(alias='qaaskaquestion')#">Ask A Question</a></li>
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