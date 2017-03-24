
<!--- @@displayname: QA: Ask A Question Form --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfparam name="form.question" default="" />
<cfparam name="form.description" default="" />
<cfparam name="form.category" default="" />

<cfset businessCatId = application.fapi.getCatId('question_business') />

<cfif isDefined('form.submit')>

	<cfscript>
		stProperties = StructNeW();
		stProperties.title = form.question;
		stProperties.label = form.question;
		stProperties.description = htmlEditFormat(form.description);

		if( request.isWorkshop and len(form.category) ) {
			stProperties.category = form.category;
		}

		stResult = application.fapi.getContentType('qaQuestion').createData(stProperties=stProperties);
	</cfscript>

	<cfif stResult.bSuccess>
		<cflocation url="#application.fapi.getLink(objectid=stResult.objectid)#" addtoken="false" />
	</cfif>

</cfif>

<cfoutput>

	<div class="questions">

		<form method="POST" role="form">

			<fieldset>

				<div class="form-group">
					<label for="question">Question</label>
					<input type="text" class="form-control" name="question" value="#form.question#" placeholder="Enter your question here...">
				</div>

				<div class="form-group">
					<label for="description">Description</label>
					<textarea class="form-control" name="description" rows="3" placeholder="Place more detail about your question here...">#form.description#</textarea>
				</div>

				<cfif request.isWorkshop>
					<div class="checkbox">
						<label>Post to Business Category? <input type="checkbox" name="category" value="#businessCatId#"></label>
					</div>
				</cfif>

				<button type="submit" class="btn btn-primary" name="submit">Post Question</button>

			</fieldset>
		</form>

	</div></cfoutput>
