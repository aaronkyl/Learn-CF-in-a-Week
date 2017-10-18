<cfquery name="portfolio" datasource="learncfinaweek">
	SELECT * FROM portfolio
</cfquery>

<cfset section="portfolio" />
<cfinclude template="includes/header.cfm" />

<!-- portfolio -->
<div id="portfolio">
	<div class="clr">
		<div class="top-bg1">
			<div class="top-left">
				<div>
					<h1>Portfolio</h1>
				</div>
			</div> 
		</div>
		<div class="clr">
			<div class="pat-bottomleft">&nbsp;</div>
			<div class="pat-bottomright">&nbsp;</div>
		</div>
	</div>
	<div class="clr">
		<h6>
			<span> I build great sites <br /></span>Hello, thanks for visiting this section. Here’s a collection of some of my work.
		</h6>
	</div>
	<div class="clr hline">&nbsp;</div>
	<div class="clr">
		<div>
			<ul id="portfolio-list">
				<!-- Start Portfolio -->
				<cfoutput>
					<cfloop query="portfolio">
						<li>
							<div class="left">
								<a href="#portfolio.website#" title="#portfolio.title#" class="viewDetail ">
									<img src="assets/images/portfolio/#portfolio.image#"   alt=" " border="0" />
									<h5>#portfolio.title#</h5>
								</a>
							</div>
							<div class="right">
								<p>
									#portfolio.summary#
								</p>
							</div>
						</li> 
					</cfloop>   
				</cfoutput>
				<!-- End Portfolio -->
			</ul>
		</div>
		<!-- demowrap end-->       
	</div>
	<!-- clr end -->
	<div class="clr"></div>
</div>
<!-- portfolio end -->

<cfinclude template="includes/footer.cfm" />