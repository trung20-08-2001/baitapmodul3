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
    <h2>Currency Converter</h2>
    <form action="/converter">
        <div class="form-group">
            <label >RATE:</label>
            <input type="text" class="form-control"  placeholder="Enter rate" name="rate" value="0">
        </div>
        <div class="form-group">
            <label >USD:</label>
            <input type="text" class="form-control" placeholder="Enter usd" name="usd" value="0">
        </div>
        <button type="submit" class="btn btn-primary">Calculator</button>
    </form>
    <div class="form-group">
        <label >VND:</label>
        <input type="text" class="form-control" placeholder="VND" name="vnd" value=${vnd}>
    </div>
</div>

</body>
</html>
