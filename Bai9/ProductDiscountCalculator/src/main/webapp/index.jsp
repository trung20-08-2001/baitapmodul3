<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 </head>
<body>

<div class="container">
  <form action="/calculator">
    <div class="form-group">
      <label>Product Description:</label>
      <input type="text" class="form-control"  placeholder="Enter Product Description:" name="description" value="description">
    </div>
    <div class="form-group">
      <label >List Price:</label>
      <input type="text" class="form-control" placeholder="Enter List Price" name="price" value="0">
    </div>
    <div class="form-group">
      <label >Discount Percent(%):</label>
      <input type="text" class="form-control" placeholder="Enter List Price" name="percent" value="0">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>
