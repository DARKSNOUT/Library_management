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
    <title>${book.id == 0 ? 'Add New' : 'Update'} Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>${book.id == 0 ? 'Add New' : 'Update'} Book</h1>
        
        <form:form method="post" modelAttribute="book" class="mt-4">
            	
            <div class="mb-3">
                <form:label path="title" class="form-label">Title</form:label>
                <form:input type="text" path="title" class="form-control" required="required"/>
                <form:errors path="title" cssClass="text-danger"/>
            </div>

            <div class="mb-3">
                <form:label path="author" class="form-label">Author</form:label>
                <form:input type="text" path="author" class="form-control" required="required"/>
                <form:errors path="author" cssClass="text-danger"/>
            </div>

            <div class="mb-3">
                <form:label path="genre" class="form-label">Genre</form:label>
                <form:input type="text" path="genre" class="form-control" required="required"/>
                <form:errors path="genre" cssClass="text-danger"/>
            </div>

            <c:if test="${book.id != 0}">
                <div class="mb-3 form-check">
                    <form:checkbox path="avail" class="form-check-input" id="avail"/>
                    <form:label path="avail" class="form-check-label" for="avail">Available</form:label>
                </div>
            </c:if>

            <form:hidden path="id"/>
            
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="/list-books" class="btn btn-secondary ms-2">Cancel</a>
            
        </form:form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>