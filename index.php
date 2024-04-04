<!DOCTYPE html>
<html>
<head>
    <title>Simple PHP Web App</title>
</head>
<body>
    <h1>Hello, <?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : 'Stranger'; ?>!</h1>
    <form method="post">
        <label for="name">Enter your name:</label>
        <input type="text" id="name" name="name">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
