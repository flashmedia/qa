<cfsetting enablecfoutputonly="yes">

<!--- @@displayname: QA: Ask A Question --->
<!--- @@author: Scott Mebberson --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset request.sBodyType = "internal" />
<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayHeaderStandard">


<cfinclude template="/farcry/plugins/qa/includedObj/_askAQuestion.cfm" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" webskin="displayFooterStandard">

<cfsetting enablecfoutputonly="no">