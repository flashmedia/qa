<cfsetting enablecfoutputonly="true">

<!--- @@displayname: Questions List --->

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<cfif NOT isDefined('request.qaaskaquestionAlias')>
	<cfset request.qaaskaquestionAlias = 'qaaskaquestion' />
</cfif>

<!-- Get the question category id -->
<cfset businessCatId = application.fapi.getCatId('question_business') />

<cfquery name="stLocal.qQuestionsRecent" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID
	FROM qaQuestion
	WHERE qaQuestion.bActive = '1'
	AND qaQuestion.category NOT LIKE '%#businessCatId#%'
	OR qaQuestion.category is NULL
	GROUP BY qaQuestion.ObjectID
	ORDER BY qaQuestion.datetimecreated DESC
</cfquery>

<cfquery name="stLocal.qQuestionsPopular" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID, count(DISTINCT qaQuestion_aViews.data) as viewcount, count(DISTINCT qaQuestion_aAnswers.data) as answercount
	FROM qaQuestion
	LEFT JOIN qaQuestion_aAnswers ON qaQuestion_aAnswers.parentid = qaQuestion.ObjectID
	LEFT JOIN qaQuestion_aViews ON qaQuestion_aViews.parentid = qaQuestion.ObjectID
	WHERE qaQuestion.bActive = '1'
	AND qaQuestion.category NOT LIKE '%#businessCatId#%'
	OR qaQuestion.category is NULL
	GROUP BY qaQuestion.ObjectID
	ORDER BY viewcount DESC, answercount DESC, qaQuestion.datetimecreated DESC
</cfquery>

<cfquery name="stLocal.qQuestionsBusiness" datasource="#application.dsn#">
	SELECT qaQuestion.ObjectID
	FROM qaQuestion
	WHERE qaQuestion.bActive = '1'
	AND qaQuestion.category LIKE '%#businessCatId#%'
	GROUP BY qaQuestion.ObjectID
	ORDER BY qaQuestion.datetimecreated DESC
</cfquery>

<cfoutput>

	<div class="tabs tabs-qa">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="##recent">Recent</a></li>
			<li><a data-toggle="tab" href="##popular">Popular</a></li>
			<li><a data-toggle="tab" href="##business">Business</a></li>
		</ul>
    <a class="btn btn-primary" href="#application.fapi.getLink(alias=request.qaaskaquestionAlias)#">Ask A Question</a>
	</div>

	<div class="tab-content">
		<div class="questions tab-pane fade in active" id="recent">
			<skin:pagination
			  query="#stLocal.qQuestionsRecent#" typename="qaQuestion"
			  r_stObject="stQuestion" paginationID="question"
			  recordsPerPage="10" pageLinks="10">
			  <skin:view typename="qaQuestion" objectid="#stQuestion.objectid#" webskin="displayTeaserStandard" />
			</skin:pagination>
		</div>

		<div class="questions tab-pane fade" id="popular">
			<skin:pagination
			  query="#stLocal.qQuestionsPopular#" typename="qaQuestion"
			  r_stObject="stQuestion" paginationID="popular"
			  recordsPerPage="10" pageLinks="10">
			  <skin:view typename="qaQuestion" objectid="#stQuestion.objectid#" webskin="displayTeaserStandard" />
			</skin:pagination>
		</div>

		<div class="questions tab-pane fade" id="business">
			<cfif request.isWorkshop>
			<skin:pagination
			  query="#stLocal.qQuestionsBusiness#" typename="qaQuestion"
			  r_stObject="stQuestion" paginationID="business"
			  recordsPerPage="10" pageLinks="10">
			  <skin:view typename="qaQuestion" objectid="#stQuestion.objectid#" webskin="displayTeaserStandard" />
			</skin:pagination>
			<cfelse>
				<p>This section is only accessible by members with a registered workshop.</p>
			</cfif>
		</div>

	</div>

	<script>
	$(document).ready(function() {
    // show active tab on reload
    if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');

    // remember the hash in the URL without jumping
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
       if(history.pushState) {
            history.pushState(null, null, '##'+$(e.target).attr('href').substr(1));
       } else {
            location.hash = '##'+$(e.target).attr('href').substr(1);
       }
    });

		//preserve tab functionality with pagination
		$('.tab-content .tab-pane').each(function(i,el) {
			var id = $(this).attr('id');
	    $(this).find('.paginator a').each(function(m,el){
				var link = $(el).attr('href');
				link = link + "##" + id;
				$(el).attr('href',link);
	    });
		});
	});
	</script>
</cfoutput>

<cfsetting enablecfoutputonly="false" />
