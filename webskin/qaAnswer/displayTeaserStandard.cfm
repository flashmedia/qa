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

<!--- show textarea line breaks into HTML breaks --->
<cfscript>
    // www.cflib.org/udf/paragraphformat2   
    answer = stObj.answer;
    answer = replace(answer,chr(13)&chr(10),chr(10),"ALL");
    answer = replace(answer,chr(13),chr(10),"ALL");
    answer = replace(answer,chr(9),"&nbsp;&nbsp;&nbsp;","ALL");
    answer = replace(answer,chr(10),"<br />","ALL");
</cfscript>

<cfoutput>
    <div class="answer">
    <p class="content">#answer#</p>
    <p class="by">Answered by <span>#sBy#</span></p>
    <p class="on">Answered <span>#application.fapi.prettyDate(stObj.datetimecreated, true)#</span></p>
    </div>
</cfoutput>


<cfsetting enablecfoutputonly="false" />