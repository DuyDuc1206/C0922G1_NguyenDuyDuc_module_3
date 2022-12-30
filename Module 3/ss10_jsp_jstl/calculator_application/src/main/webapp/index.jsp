<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/30/2022
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculator" method="post">
    <pre>First Operand  <input type="number" name="firstNumber" step=".01" required></pre>
    <pre>Operator       <select name="operator" >
      <option value="+">Addition</option>
      <option value="-">Subtraction</option>
      <option value="*">Multiplication</option>
      <option value="/">Division</option>
    </select></pre>
    <pre>Second Operandr<input type="number" name="secondNumber" step=".01" required></pre>
    <button type="submit" >Calculator</button>
  </form>
  </body>
</html>
