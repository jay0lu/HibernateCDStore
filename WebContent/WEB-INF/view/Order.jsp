<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.util.List"%>


<%
String[][] id= new String [30][2];
BigDecimal total = BigDecimal.ZERO;
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

<h1>Add Order</h1>

<%
Cookie[] cdc=request.getCookies();  
int i=0;
String tt="0";
String qnty="0";
int cc=0; 
  
for(Cookie cookie : cdc){
   
    if(cookie.getName().equals("total")){
            
          tt = cookie.getValue();}else{
        	  //--- to get quantity
        	 qnty="0";
  
    if((cookie.getName().substring(0,2).equals("cd"))){
        
         cc=0;
        	   for(int j=0; j<cookie.getValue().length(); j++) {
               if (cookie.getValue().charAt(j)=='_'){ cc++;}
                else {if (cc==3){qnty =qnty+ cookie.getValue().charAt(j);}}
                 }
                 id[i][0]=cookie.getName().substring(2);
                 id[i][1]=qnty; %>
                 <td >
               <p> cdid= <%=id[i][0] %> quantity  <%=id[i][1] %></p>
              </td>
                 
                 <%i++;}                   
        }
        	  
     //--------------   	  
          }
                                 
                       	
        	// String s = "1.01";
        	 BigDecimal big = new BigDecimal(tt);
        	total= total.add(big);
        	
           %>
           
        

	<form action="addOrder" method="post">
		<table cellpadding="3pt">
			<tr>
				<td>Email :</td>
				<td><input readonly name="userName" value=<%=session.getAttribute("sessionId") %> /></td>
			</tr>
      <!--  <tr>
				<td>Detail :</td>
				<td><input type="text" name="orderDetails" /></td>
			</tr>
  			<tr>   -->   
				<td>Price :</td>
				<td><input readonly name="price" value=<%=tt %> /></td>
			</tr>
    		<tr>
    			<td>Date :</td>
				<td>
					<%SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					  Date currenttime = new Date();
					  out.print(simpledateformat.format(currenttime));
				%>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="Add Order" />
	</form>