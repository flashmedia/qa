<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->

<!--- @@displayname: Standard Teaser --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->


<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<!--- grab the profile to display --->
<cftry>
    <cfset stProfile = application.fapi.getContentType('dmProfile').getProfile(stObj.createdBy) />
    <cfset sBy = '#stProfile.firstname# #stProfile.lastname#' />
    <cfcatch type="any">
        <cfset sBy = #stObj.createdBy# />
    </cfcatch>
</cftry>

<cfoutput>
    <div class="question">
	<h2><skin:buildLink objectid="#stObj.objectid#">#stObj.title#</skin:buildLink></h2>
    <p class="by">Asked by <span>#sBy#</span></p>
    <p class="on">Asked <span>#application.fapi.prettyDate(stObj.datetimecreated, true)#</span></p>
    <div class="answers<cfif ArrayLen(stObj.aAnswers) GT 0> answered</cfif>"><span class="badge">#ArrayLen(stObj.aAnswers)#</span> answers</div>
    <div class="views"><span class="badge">#ArrayLen(stObj.aViews)#</span> views</div>
    </div>
</cfoutput>


<cfsetting enablecfoutputonly="false" />