<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.List"%>


<%
/*	if ((!session.getAttribute("category").equals(null)) || (!session.getAttribute("category").equals("")))
	{
		String category = (String) session.getAttribute("category");
		CDDAO cdDao = new CDDAO();
		List<CD> cd = cdDao.getAllCD(category);
	} */
	//BigDecimal pricefromsession = BigDecimal.ZERO;
	//int stock = 0;
%>

<%
	String tit = "", price = "", urlm = "", qnty = "", stotal = "", bid = "myid", bttn = "", bttn2 = "";
	BigDecimal total = BigDecimal.ZERO;
	BigDecimal temp = BigDecimal.ZERO;
%>


<div class="container-fluid">
	<div class="col-md-12">
		<div class="jumbotron jumbotron-bg1">
			<%
				if (session.getAttribute("sessionId") != null) {
					out.println("<h2 id='firstheading'>" + session.getAttribute("sessionId") + "</h2>");
					out.println("<p id='firstpar'>Like the items in your cart?! Why don't you go ahead and Check them out?</p>");
				} else {
					out.println("<h2 id='firstheading'>Dear Visitor</h2>" + "<h3>To check out, please login!</h3>");
				}
			%>

		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="col-md-11">
		<h1>Shopping Cart:</h1>
		<p><br /></p>
	</div>
</div>

<div class="container-fluid">
	<div class="col-md-8">
		<div class="mytable1">
			<table>
				<tr>
					<th>CD TiTle</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Update</th>
					<th>Remove</th>
				</tr>
				<%
					Cookie[] cdc = request.getCookies();

					int i = 0;
					String tt = "";
					int cc = 0;

					total = BigDecimal.ZERO;
					for (Cookie cookie : cdc) {
						tit = "";
						price = "";
						urlm = "";
						qnty = "";
						tt = "";
						if ((cookie.getName().substring(0, 2).equals("cd"))) {

							cc = 0;
							for (int j = 0; j < cookie.getValue().length(); j++) {

								if (cookie.getValue().charAt(j) == '_') {
									cc++;
								} else {
									if (cc == 0) {
										tt = tt + cookie.getValue().charAt(j);
									} else {
										if (cc == 1) {
											price = price + cookie.getValue().charAt(j);
										} else {
											if (cc == 2) {
												urlm = urlm + cookie.getValue().charAt(j);
											} else {
												qnty = qnty + cookie.getValue().charAt(j);
											}
										}
									}
								}
							}

							bid = "myid" + Integer.toString(i);
							bttn = "umyb" + Integer.toString(i);
							bttn2 = "myb" + Integer.toString(i);
							tit = tt.replaceAll("\\+", " ");
							if (price.isEmpty()) {
								price = "0.0";
							}
							if (qnty.isEmpty()) {
								qnty = "0";
							}

							//Double x=Double.parseDouble(price);
							BigDecimal big = new BigDecimal(price);
							BigDecimal qnt = new BigDecimal(qnty);
							big = big.multiply(qnt);
							total = total.add(big);
							//total= total.add(90.000);
				%>

				<tr>
					<td><%=tit%></td>
					<td><%=price%></td>
					<td><input class="mytextbox" type="number" name='x' size="3"
						max="1000" min="0" value="<%=qnty%>" id='<%=bid%>' /></td>
					<td><input class="myButton2" type="button" value="Update"
						id='<%=bttn%>'
						onclick="WritetoCookie('<%=cookie.getName()%>','<%=tit%>','<%=price%>','<%=urlm%>','<%=bid%>','<%=total%>')" />

					</td>
					<td><input class="myButton2" type="button" value="Remove"
						id='<%=bttn2%>'
						onclick="eraseCookie('<%=cookie.getName()%>','<%=bttn2%>' )" /></td>
				</tr>


				<%
					i++;
						}
					}
					if (i == 0) {
				%>
				<h3>You have not selected any CDs!</h3>
				<%
					}
				%>
			</table>
		</div>
	</div>
</div>


<p>
	<br />
</p>
<p>
	<br />
</p>
<br />

<div class="container-fluid">
	<div class="col-md-6">

		<%
			stotal = total.toString();
		%>

	<table>
		 <tr>
		 	<td>
		 	 	<input type="button" value="Refresh for updated price!" onclick="refresh()" />
		 	</td>
		 	 <td>
		 	</td>
		 </tr>
	
		  <tr>
		 	<td>
		 	 	<h1>Total price: <%=stotal%> &nbsp;&nbsp;&nbsp;</h1>
		 	</td>
		 	 <td>
		 	</td>
		 </tr>
	
		 <tr>
		 	<td>
		 		<h1>Check out &nbsp;&nbsp; --> </h1>
		 	</td>
		 	<td>
		 	<% if (stotal.equals("0") ){ %>
		 		<input class="myButton" type="submit" value="        Checkout        "	onclick="nothingForCheckOut()" />
		 	<% } else { %>
			 	<form action="Order" method="post">
		 			<input class="myButton" type="submit" value="        Checkout        "	onclick="createcookie('<%=stotal%>' )" />
		 		</form>		 		
		 	<% } %>
		 	</td>
		 </tr>
	</table>
		
	</div>
</div>

<p><br /></p>
<p><br /></p>
<p><br /></p>



