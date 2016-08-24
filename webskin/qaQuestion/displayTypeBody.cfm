<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfif NOT isDefined('request.qaaskaquestionAlias')>
	<cfset request.qaaskaquestionAlias = 'qaaskaquestion' />
</cfif>

<cfquery name="stLocal.qQuestionsRecent" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID
	FROM qaQuestion
	WHERE qaQuestion.bActive = '1'
	GROUP BY qaQuestion.ObjectID
	ORDER BY qaQuestion.datetimecreated DESC
</cfquery>

<cfquery name="stLocal.qQuestionsPopular" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID, count(DISTINCT qaQuestion_aViews.data) as viewcount, count(DISTINCT qaQuestion_aAnswers.data) as answercount
	FROM qaQuestion
	LEFT JOIN qaQuestion_aAnswers ON qaQuestion_aAnswers.parentid = qaQuestion.ObjectID
	LEFT JOIN qaQuestion_aViews ON qaQuestion_aViews.parentid = qaQuestion.ObjectID
	WHERE qaQuestion.bActive = '1'
	GROUP BY qaQuestion.ObjectID
	ORDER BY viewcount DESC, answercount DESC, qaQuestion.datetimecreated DESC
</cfquery>

<cfoutput>

	<div class="tabs tabs-qa">
		<ul class="nav nav-tabs">
			<li class="active" data-type="recent"><a href="##">Recent</a></li>
			<li data-type="popular"><a href="##">Popular</a></li>
		</ul>
        <a class="btn btn-primary" href="#application.fapi.getLink(alias=request.qaaskaquestionAlias)#">Ask A Question</a>
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
