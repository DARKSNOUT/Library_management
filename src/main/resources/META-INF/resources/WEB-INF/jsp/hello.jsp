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
	
	
		<title>Welcome Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
    <div class="fs-1 fw-bold my-4">Welcome to The Library</div>
    <div class="fs-3 fw-bold my-3">Your Name: ${username}</div>
    <div class="fs-3 my-3">
    <div>
  	<a href='list_books' class="btn btn-primary btn-lg">Manage Library</a>
	</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>