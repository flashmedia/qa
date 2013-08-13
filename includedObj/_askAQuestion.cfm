
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

			<div class="control-group">
				<label class="control-label" for="question">Question</label>
				<div class="controls">
					<input type="text" name="question" value="#form.question#" placeholder="Enter your question here...">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="question">Description</label>
				<div class="controls">
					<textarea name="description" placeholder="Enter your question here...">#form.description#</textarea>
				</div>
			</div>

			<div class="control-group">
				<input type="submit" name="submit" value="submit" />
			</div>

		</form>

	</div></cfoutput>

