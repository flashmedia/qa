
<!--- @@displayname: QA: Ask A Question Form --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfdump var="#form#" />

<cfparam name="form.question" default="" />
<cfparam name="form.description" default="" />

<cfoutput>
	<div class="header">
		<h1 class="main">Ask A Question</h1>
		<button type="button" class="askButton" data-href="/question">Answer Questions</button>
	</div>
	<div class="questions">

		<form method="POST">
			<fieldset>

				<div class="control-group">
					<label class="control-label" for="question">Question</label>
					<div class="controls">
						<input type="text" class="input-block-level" name="question" value="#form.question#" placeholder="Enter your question here...">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="description">Description</label>
					<div class="controls">
						<textarea class="input-block-level" name="description" rows="3">#form.description#</textarea>
					</div>
				</div>

				<div class="form-actions">
					<button type="submit" class="btn">Sign in</button>
				</div>

			</fieldset>
		</form>

	</div></cfoutput>

