<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("sessionID");
	String orderDetail = (String) session.getAttribute("orderDetails");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
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



<h1>Confirm Order</h1>
	<form action="confirmOrder" method="post">
	<table cellpadding="3pt">
			<tr>
				<td>UserName :</td>
				<td><input type="text" name="userName" size="40" value="<%= username %>"/></td>
			</tr>
			<tr>
				<td>OrderDetail :</td>
				<td><input type="text" name="orderDetail" value="<%= orderDetail%>"/></td>
			</tr>
			<tr>
				<td>DateTime :</td>
				<td><input type="text" name="dateTime"  value="<%= datetime%>"/></td>
			</tr>
			<tr>
				<td>Price :</td>
				<td><input readonly name="price"  value="<%= price%>"/></td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr>
				<td>PhoneNumber :</td>
				<td><input type="text" name="phoneNumber" /></td>
			</tr>
		</table>
		<p />
		<input type="submit" value="Confirm Order" />
	</form>




