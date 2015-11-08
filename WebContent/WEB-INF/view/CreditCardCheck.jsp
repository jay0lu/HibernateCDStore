<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("sessionId");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
	
	System.out.println("credit card check session =" + session.getAttribute("sessionId"));
%>



<div class="container-fluid">
    <div class="col-md-3">
    </div>
    <div class="col-md-6">
        <div class="hovershine">
            <figure>
                <img src="images/popbanner.jpg"/>
            </figure>
        </div>
    </div>
    <div class="col-md-3">
    </div>
</div>




<form action="checkCreditCard" method="post">
		<table cellpadding="3pt">
		<tr>
			<td>CardNumber :</td>
			<td><input class="input" type="number" name="cardNumber"/></td>
		</tr>
		<tr>
			<td>CardPassword :</td>
			<td><input type="password" name="cardPassword" /></td>
		</tr>
		<tr>
			<td>BankName :</td>
			<td><input type="text" name="bankName" /></td>
		</tr>
		<tr>
			<td>HolderName :</td>
			<td><input type="text" name="holderName" size="40"/></td>
		</tr>
		<tr>
			<td>MaxLimit :</td>
			<td><input type="text" name="maxLimit" /></td>
		</tr>
		<tr>
			<td>Email :</td>
			<td><input type="text" name="userName" size="40" value="<%=session.getAttribute("sessionId") %>"/></td>
		</tr>
		<tr>
			<td>DateTime :</td>
			<td><input readonly name="dateTime" value="<%= datetime%>"/></td>
		</tr>
		<tr>
			<td>Price :</td>
			<td><input readonly name="price" value="<%= price%>"/></td>
		</tr>
		</table>
		<input type="submit" value="Submit" />
		</form>





