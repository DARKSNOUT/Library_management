<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Library Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Library Books</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>Available</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.genre}</td>
                    <td>${book.avail ? 'Yes' : 'No'}</td>
                    <td>
                        <a href="delete-book?id=${book.id}" class="btn btn-warning">Delete</a>
                        <a href="update-book?id=${book.id}" class="btn btn-success">Update</a>
                        <a href="toggle-availability?id=${book.id}" class="btn btn-info">
                            ${book.avail ? 'Check Out' : 'Return'}
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="add-book" class="btn btn-primary">Add New Book</a>
</div>
<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>