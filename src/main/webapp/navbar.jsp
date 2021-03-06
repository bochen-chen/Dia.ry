<%
    String name = (session.getAttribute("name") == null) ? "" : session.getAttribute("name").toString();
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container">
        <a class="navbar-brand" href="/">Dia.ry</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
            <% if(name != "") { %>
                <li class="nav-item">
                    <a class="nav-link" href="/diaries.jsp">My Diaries</a>
                </li>
            <% }%>
            </ul>
            <ul class="navbar-nav ml-auto">
            <% if(name == "") { %>
                <li class="nav-item">
                    <a class="nav-link" href="/register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            <% } else { %>
                <li class="nav-item mr-3">
                    <span class="navbar-text">Hi, <%=name %></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            <% } %>
            </ul>
        </div>
    </div>
</nav>