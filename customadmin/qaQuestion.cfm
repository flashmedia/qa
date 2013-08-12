<cfsetting enablecfoutputonly="yes">

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<!--- set up page header --->
<admin:header title="Manage questions" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectAdmin 
	typename="qaQuestion" 
	title="Manage questions" 
	permissionset="news"
	ColumnList="title,datetimelastUpdated,lastupdatedby"
	SortableColumns="title,datetimelastUpdated,lastupdatedby"
	lFilterFields="title"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastupdated desc"
	plugin="qa" />

<!--- page footer --->
<admin:footer />
