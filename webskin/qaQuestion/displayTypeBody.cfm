<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfset stLocal.qQuestions = application.fapi.getContentObjects(typename="qaQuestion",orderBy="datetimecreated") /> 
 
<cfoutput><h1>Questions</h1></cfoutput>
 
<cfloop query="stLocal.qQuestions">
  <skin:view typename="qaQuestion" objectid="#stlocal.qQuestions.objectid#" webskin="displayTeaserStandard" />
</cfloop>
 
<cfsetting enablecfoutputonly="false" />