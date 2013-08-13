<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Question Display Body --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfoutput>

	<h2>#stObj.label#</h2>

	<p>#stObj.description#</p>

</cfoutput>
 
<cfsetting enablecfoutputonly="false" />