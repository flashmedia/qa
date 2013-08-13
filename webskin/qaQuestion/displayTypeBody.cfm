<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfset stLocal.qQuestions = application.fapi.getContentObjects(typename="qaQuestion",orderBy="datetimecreated") /> 
 
<cfoutput>
	<h1 class="main">Questions</h1>
	<div id="breadCrumbs">
		</cfoutput>
		<skin:breadcrumb separator=" <span class='divider'>&gt;</span> " here="Questions">
		<cfoutput>
	</div>
</cfoutput>
 
<cfloop query="stLocal.qQuestions">
  <skin:view typename="qaQuestion" objectid="#stlocal.qQuestions.objectid#" webskin="displayTeaserStandard" />
</cfloop>
 
<cfsetting enablecfoutputonly="false" />