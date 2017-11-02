<cfset blogPosts = entityLoad("blogPost") />

<cfquery name="blogCategories">
	SELECT * FROM category
</cfquery>

<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="blog">

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
			<div class="left">
				<!-- Blog Posts -->
				<!-- Start Blog Post -->
				<cfoutput>
					<cfloop array="#blogPosts#" index="blogPost">
						<h5>
							<span>#dateFormat(blogPost.datePosted, "mm/dd/yyyy")#</span>
						</h5>
						<h2>
							<a href="blogpost.cfm?id=#blogPost.id#">#blogPost.title#</a>
						</h2>
						<p>#blogPost.summary#</p>
						<p class="summary">
							<!---<strong>Categories:</strong><cfoutput> #myPosts.category# </cfoutput>---><strong>Comments:</strong> #arrayLen(blogPost.getComments())#
						</p>
					</cfloop>
				</cfoutput>
				<!-- End Blog Post -->
			</div>
			<div class="right" >
				<h2>Categories</h2>
				<!-- Start Blog Categories -->
				<div id="categories" align="center">
					<ul>
						<cfoutput query="blogCategories">
							<li><a href="##">#blogCategories.name#</a></li>
						</cfoutput>
					</ul>
				</div>
				<!-- End Blog Categories -->
			</div>
		</div>
	</div>
	<div class="clr"></div>
</div> <!--blog end -->

</layout:page>