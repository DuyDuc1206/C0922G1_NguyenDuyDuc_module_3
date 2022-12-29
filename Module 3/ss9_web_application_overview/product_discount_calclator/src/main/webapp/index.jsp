<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/29/2022
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
  <form action="/display_discount" method="post">
    <pre>
      Product Description: <input type="text" name="description">
    </pre>
    <pre>
      List Price:          <input type="number" name="price">
    </pre>
    <pre>
      Discount Amount:     <input type="number" name="amount">
    </pre>
    <button type="submit">Calculate Discount</button>
  </form>
  </body>
</html>
