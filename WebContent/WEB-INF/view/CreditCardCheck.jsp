<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("sessionId");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
	
	System.out.println("credit card check session =" + session.getAttribute("sessionId"));
%>



<form id="myform1" class="myform1" name="form" action="checkCreditCard" method="post">
 <h1>Billing Info</h1>
    <div class="content1">
        <div class="intro1"><p>Add billing details! (credit card)</p></div>
        <div id="section0" >
            <div class="field1">
                <label for="cardNumber">Card Number</label><input type="number" id="cardNumber" name="cardNumber" placeholder="Card Number" required>
            </div>
            <div class="field1">
                <label for="cardPassword">Card Password</label><input type="password" id="cardPassword" name="cardPassword" required>
            </div>
            <div class="field1">
                <label for="bankName">Bank Name</label><input type="text" id="bankName" name="bankName" placeholder="Bank Name">
            </div>
            <div class="field1">
                <label for="holderName">Holder Name</label><input type="text" id="holderName" name="holderName" size="50" placeholder="Holder Name">
            </div>
            <div class="field1">
             <div class="edit-options">
              <div class="edit"></div><div class="delete"></div></div>
                <label for="maxLimit">Max Limit</label><input type="text" id="maxLimit" name="maxLimit" placeholder="Max Limit">
            </div>
            <div class="field1">
                <label for="userName">Email</label><input type="email" id="userName" name="userName" maxlength="40" value="<%=session.getAttribute("sessionId") %>" readonly>
            </div>
            <div class="field1">
                <label for="dateTime">Date Time</label><input type="text" id="dateTime" name="dateTime"  value="<%= datetime%>" readonly>
            </div>
            <div class="field1">
                <label for="price">Price</label><input type="text" id="price" name="price" value="<%= price%>"readonly>
            </div> <p><br /></p>
            <div class="field1">
              <input class="myButton" type="submit" id="Submit" value="Submit">
            </div>
        </div>
    </div>
</form>





