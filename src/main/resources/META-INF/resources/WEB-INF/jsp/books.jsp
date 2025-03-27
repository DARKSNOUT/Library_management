<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<nav class="navbar navbar-expand-md navbar-light bg-light mb-3 p-1">
	<a class="navbar-brand m-1" href="https://www.ajackus.com/">Jackus</a>
	<div class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="list_books">Todos</a></li>
		</ul>
	</div>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
	</ul>	
	</nav>
    <title>Library Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<div class="container">
    <form action="find-book" method="GET" class="form-inline">
    <div class="input-group">
        <input type="text" class="form-control" name="title">
        <button type="submit" class="btn btn-primary">Find the book</button>
    </div>
</form>
    
</div>


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
                        <a href="toggle-availability?id=${book.id}" class="btn btn-warning">
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