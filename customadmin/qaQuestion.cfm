<cfsetting enablecfoutputonly="yes">

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<ft:processForm action="activate">
    <cfset application.fapi.getContentType('qaQuestion').activate(objectid=form.selectedObjectId) />
</ft:processForm>

<ft:processForm action="deactivate">
    <cfset application.fapi.getContentType('qaQuestion').deactivate(objectid=form.selectedObjectId) />
</ft:processForm>

<!--- set up page header --->
<admin:header title="Manage questions" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectAdmin
	typename="qaQuestion"
	title="Manage questions"
	permissionset="news"
	ColumnList="title,bActive,datetimelastUpdated,lastupdatedby"
	SortableColumns="title,datetimelastUpdated,lastupdatedby"
	lFilterFields="title"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastupdated desc"
	plugin="qa"
    lCustomActions="activate:Activate,deactivate:Deactivate" />

<!--- page footer --->
<admin:footer />
