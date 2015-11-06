<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.List"%>
<% 
	String category = (String) session.getAttribute("category");
	
	BigDecimal pricefromsession = BigDecimal.ZERO;
	int stock = 0;	
	
	CDDAO cdDao = new CDDAO();
	List<CD> cd = cdDao.getAllCD(category);
%>
<%
String tit="",price="",urlm="",qnty="",stotal="",bid="myid", bttn="",bttn2="";
BigDecimal total = BigDecimal.ZERO;
BigDecimal temp = BigDecimal.ZERO;
%>



<% System.out.println("cart session= " + session.getAttribute("sessionId")); %>>

<div class="container-fluid">
	<div class="col-md-11">
		<div class="jumbotron jumbotron-bg1">
			<h2 id="firstheading"> <% session.getAttribute("sessionId"); %>></h2>
			<p id="firstpar">Like the items in your cart?! Why don't you go
				ahead and Check them out?</p>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="col-md-11">
		<p>Shopping Cart:</p>
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
Cookie[] cdc=request.getCookies();  

int i=0;
String tt="";
int cc=0;
//total=0;
for(Cookie cookie : cdc){
    tit="";price="";urlm="";qnty="";
   tt="";
    if((cookie.getName().substring(0,2).equals("cd"))){
        
         cc=0;
         for(int j=0; j<cookie.getValue().length(); j++) {
             
             if (cookie.getValue().charAt(j)=='_'){ cc++;}
                 else { if (cc==0)
                 {tt =tt+ cookie.getValue().charAt(j);}
                 else {if (cc==1){price =price+ cookie.getValue().charAt(j);}
                 else {if (cc==2){urlm =urlm+ cookie.getValue().charAt(j);}else{qnty =qnty+ cookie.getValue().charAt(j);}}
                 }
                 }                   
        }
         
         bid="myid"+ Integer.toString(i);
       bttn="umyb"+ Integer.toString(i);
       bttn2="myb"+ Integer.toString(i);
        	 tit=tt.replaceAll("\\+"," ");
        	
        	 //Double x=Double.parseDouble(price);
        	BigDecimal big = new BigDecimal(price);
        	 BigDecimal qnt = new BigDecimal(qnty);
        	 big=big.multiply(qnt);
        	total= total.add(big);
        	//total= total.add(90.000);
        	
           %>

				<tr>
					<td><%=tit %></td>
					<td><%=price%></td>
					<td><input class="mytextbox" type="number" name='x' size="3"
						max="100" min="0" value="<%=qnty%>" id='<%=bid %>' /></td>
					<td><input class="myButton2" type="button" value="Update" id='<%=bttn %>'
						onclick="WritetoCookie('<%=cookie.getName()%>','<%=tit %>','<%=price%>','<%=urlm %>','<%=bid %>','<%=total %>')" />

					</td>
					<td><input class="myButton2" type="button" value="Remove" id='<%=bttn2 %>'
						onclick="eraseCookie('<%=cookie.getName()%>','<%=bttn2 %>' )" /></td>
				</tr>


				<% i++; }} 
    if (i==0){%>
				<p>You did not select any CD</p>
				<% }
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


<div class="container-fluid">
	<div class="col-md-3">

		<%stotal=total.toString(); %>
		<p>
			Total price:
			<%=stotal%>
		</p>
		<p>Checkout
		<form action="Order" method="post">
			<input class="myButton" type="submit" value="Checkout"
				onclick="createcookie('<%=stotal%>' )" />
		</form>
		</p>


	</div>
</div>


