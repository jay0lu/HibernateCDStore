<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.List"%>
<%
	//String category = (String)request.getSession().getAttribute("category"); 
	String category = (String) session.getAttribute("category");

	int cdid = -1;
	String cdName = "";
	String singer = "";
	String details = "";
	String OverAllScore = "";
	String countcomments = "NO";

	BigDecimal price = BigDecimal.ZERO;
	int stock = 0;
	String img = "";

	CDDAO cdDao = new CDDAO();
	List<CD> cd = cdDao.getAllCD(category);

	int size = cd.size();
%>



<div class="container-fluid">
	<div class="row">

		<div class="col-md-12">
			<h3>
				&nbsp;&nbsp;&nbsp;List of Available Items:(<%=category%>)
			</h3>
			<br />

			<%
				if (size != 0) {
					for (int i = 0; i < size; i++) {
						cdName = cd.get(i).getCdName();
						singer = cd.get(i).getSinger();
						details = cd.get(i).getDetails();
						category = cd.get(i).getCategory();
						price = cd.get(i).getPrice();
						stock = cd.get(i).getStock();
						img = cd.get(i).getImg();
						cdid = cd.get(i).getCdid();

						CDDAO cdDAO = new CDDAO();
						double allscore = cdDAO.displayOverallScore(cdid);

						int countcommentsint = cdDao.displayTheNumberofComments(cdid);
						if (countcommentsint >= 1) {
							countcomments = String.valueOf(countcommentsint);
						} else {
							countcomments = "0";
						}
			%>

			<div class="col-sm-4 col-lg-4 col-md-4">
				<div class="thumbnail thumbnail-bg">
					<ul class="hoverflip">
						<li>
							<figure>
								<img src=<%=img%> alt="" />
								<figcaption class="caption">
									<h2>Featured Songs on this Album:</h2>
									<p><%=details%></p>
								</figcaption>
							</figure>
						</li>
					</ul>
					<div class="caption">
						<h2 class="pull-right">
							$<%=price%></h2>
						<h2>
							<a href='/HibernateWebApp/cdInfo?cdName=<%=cdName%>'><%=cdName%></a>
							<!-- link to cdinfo -->
						</h2>
						<h3>
							Singer:
							<%=singer%></h3>
						<%
							if (stock == 0) {
						%>
						<button class="myButton2 center" onclick="noItemInStock()">Add
							to Cart</button>
						<%
							} else {
						%>
						<button class="myButton2 center"
							onclick="WriteCookie('<%=cdid%>','<%=cdName%>','<%=price%>','<%=img%>','1')">Add
							to Cart</button>
						<%
							}
						%>
					</div>
					<div class="ratings">
						<p class="pull-right">
							<%=countcomments%>
							reviews
						</p>

						<p>
							<%
								if (allscore < 0.0000) {
							%>
							<span class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span>
							<%
								} else if (allscore >= 0.0000 && allscore < 2.0000) {
							%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span>
							<%
								} else if (allscore >= 2.0000 && allscore < 3.0000) {
							%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span>
							<%
								} else if (allscore >= 3.0000 && allscore < 4.0000) {
							%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <span
								class="glyphicon glyphicon-star-empty"></span>
							<%
								} else if (allscore >= 4.0000 && allscore < 5.0000) {
							%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span>
							<%
								} else {
							%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span>
							<%
								}
							%>
						</p>
					</div>
				</div>
			</div>
			<%
				}
				}
			%>



		</div>
	</div>
</div>


<!-- Footer -->
<!--<hr> -->
<div class="container-fluid bodybg2" id="footerTitle">
	<footer>
		<div class="row">
			<div class="col-lg-12">Copyright &copy; J2IK 2015</div>
		</div>
	</footer>
</div>

</body>
</html>