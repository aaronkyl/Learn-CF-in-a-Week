<cfset blogPost = entityLoad("blogPost", url.id, true) />

<cfparam name="form.submitted" default="0" />

<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="blogpost">

<!-- blog -->
<div id="blog">
	<div class="clr">
		<div class="top-bg1">
			<div class="top-left">
				<div><h1>Blog</h1></div>
			</div> 
		</div>
		<div class="clr">
			<div class="pat-bottomleft">&nbsp;</div>
			<div class="pat-bottomright">&nbsp;</div>
		</div>
	</div>
	<div class="blog-top">	
		<div class="clr">
			<cfoutput>
				<div class="left">
					<!-- Blog Title -->
					<h2 class="big">
						#blogPost.title#
					</h2>
					<!-- Date Published -->
					<h5>
						<strong>Date Posted</strong>: #dateFormat(blogPost.datePosted, "mm/dd/yyyy")#
					</h5>
					<!-- Blog Body -->
					<p>
						#blogPost.body#
					</p>
					<!-- Blog Export -->
					<p>
						<a href="exportToPDF.html?id=#blogPost.id#" target="_new"><img src="assets/images/export_pdf.png" border="0"/></a>
					</p>
					<!-- Blog Comments Section -->
					<h3>
						Comments (#arraylen(blogPost.getComments())#)
					</h3>
					<div class="clr hline">&nbsp;</div>

					<div class="clr comments">
						<ul>
							<cfloop array="#blogPost.getComments()#" index="comment">
								<li>
									<p>
										<strong>Posted On:</strong> #dateFormat(comment.createdDateTime, "mm/dd/yyyy")# at #timeFormat(comment.createdDateTime, "short")# By #comment.author#
									</p>
									<p>
										#comment.comment#
									</p>
									<div class="clr hline">&nbsp;</div>
								</li>
							</cfloop>
						</ul>
					</div>
					<h3>
						Post Comment
					</h3>
					<div class="clr hline">&nbsp;</div>

					<div class="clr postComment">
						<form action="blogpost.cfm" method="post" id="form">
							<div>
								<label>Name <span class="font-11">(required)</span></label>
								<input name="contactname" type="text" class="required" />
							</div>
							<div class="textarea">
								<label>Comment <span class="font-11">(required)</span></label>				
								<textarea name="comment" rows="6" cols="60" class="required"></textarea>		
							</div>
							<div>
								<input id="submitBtn" value="Submit"  name="submit" type="submit" class="submitBtn" />
							</div>
							<input type="hidden" name="submitted" value="1" />
						</form>
					</div>	
				</div>
				<div class="right" >
					<h2>Categories</h2>
					<!-- Blog Specific Categories -->
					<div id="categories" align="center">
						<ul>
							<li><a href="##">ColdFusion</a></li>
							<li><a href="##">Development</a></li>
						</ul>
					</div>
				</div>
			</cfoutput>
		</div>
	</div>
	<div class="clr"></div>
</div> <!--blog end -->

</layout:page>