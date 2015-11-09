<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("sessionID");
	String orderDetail = (String) session.getAttribute("orderDetails");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
%>


<p><br /></p>

<form id="myform1" class="myform1" name="form" action="confirmOrder" method="post">
 <h1>Confirm Order</h1>
    <div class="content1">
        <div class="intro1"></div>
        <div id="section0" >

            <div class="field1">
                <label for="userName">User Name</label><input type="text" id="userName" name="userName" value="<%=session.getAttribute("sessionId")%>">
            </div>
            <div class="field1">
                <label for="orderDetail">Order Detail</label><input type="text" id="orderDetail" name="orderDetail" value="<%= orderDetail%>">
            </div>
            <div class="field1">
                <label for="price">Price</label><input type="text" id="price" name="price" value="<%= price%>">
            </div>
            <div class="field1">
                <label for="address">Address</label><input type="text" id="address" name="address"  placeholder="address" required>
            </div>
            <div class="field1">
                <label for="phoneNumber">Phone Number</label><input type="text" id="phoneNumber" name="phoneNumber"  placeholder="phone number">
            </div><br />
            <div class="field1">
              <input class="myButton" type="submit" id="Submit" value="Confirm Order">
            </div>
        </div>
    </div>
</form>

<p><br /></p>
<p><br /></p>
<p><br /></p>


