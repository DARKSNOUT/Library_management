<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
	<nav class="navbar navbar-expand-md navbar-light bg-light mb-3 p-1">
	<a class="navbar-brand m-1" href="https://www.ajackus.com/">Jackus</a>
	<div class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="list_books">Manage</a></li>
		</ul>
	</div>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
	</ul>	
	</nav>
    <title>${book.id == 0 ? 'Add New' : 'Update'} Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h1>Search Results for: "${param.title}"</h1>
    
    <c:choose>
        <c:when test="${empty foundBooks}">
            <p>No books found.</p>
        </c:when>
        <c:otherwise>
            <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Available</th>
                </tr>
                <c:forEach items="${foundBooks}" var="book">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.avail ? 'Yes' : 'No'}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    
    <br>
</body>
</html>
