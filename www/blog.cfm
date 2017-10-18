<cfquery name="myPosts" datasource="learncfinaweek">
	SELECT
		post.id AS 'postid',
		post.title AS 'title',
		post.summary AS 'summary',
		post.dateposted AS 'dateposted',
		category.name AS 'category'
	FROM 
		post
	INNER JOIN
		postcategoryjn ON postcategoryjn.postid = post.id
	INNER JOIN
		category ON category.id = postcategoryjn.categoryid
	WHERE
		post.deleted = 0
	ORDER BY
		post.id
</cfquery>

<cfquery name="blogCategories" datasource="learncfinaweek">
	SELECT * FROM category
</cfquery>

<cfset section="blog" />
<cfinclude template="includes/header.cfm" />

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
				<cfoutput query="myPosts" group="postid">
					<h5>
						<span>#dateFormat(myPosts.dateposted, "mm/dd/yyyy")#</span>
					</h5>
					<h2>
						<a href="blogpost.html?id=#myPosts.postid#">#myPosts.title#</a>
					</h2>
					<p>#myPosts.summary#</p>
					<p class="summary">
						<strong>Categories:</strong><cfoutput> #myPosts.category# </cfoutput><strong>Comments:</strong> 12
					</p>
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

<cfinclude template="includes/footer.cfm" />