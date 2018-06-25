<%@ page import="model.entity.Resource" %>
<%@ page import="model.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  User usuario = (User) request.getAttribute("User");
    List<Resource> resourceList = (List<Resource>) request.getAttribute("ResourceList");
    String serverResponse = (String) request.getAttribute("serverResponse");
    if (serverResponse == null) serverResponse = "!";
%>
<html lang="es">
<head>
    <title>Resources - Hotel Services</title>

    <meta name="google-signin-client_id" content="746890482047-c734fgap3p3vb6bdoquufn60bsh2p8l9.apps.googleusercontent.com">

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link type="text/css" rel="stylesheet" href="/css/Diseno.css">
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="/css/Elements.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <script src="/js/GlobalJs.js" async defer></script>

</head>
<body>

<nav style="background-color: #67c9b3">
    <div class="nav-wrapper">
        <a class="whiteLink hide-on-small-only" href="../" style="padding: 0 0 0 20px; font-family: 'Product Sans', Roboto, serif; font-size: xx-large">Hotel Services</a>

        <div class="right valign-wrapper" style="padding: 0 0 0 10px; cursor: pointer; min-width: 150px;" onclick="changeUserOptions()">

            <span style="min-width: 80px;">
                <%= usuario.getName()%>
            </span>
            <img src="<%=usuario.getImgUrl()%>" alt="" class="circle responsive-img" style="padding: 5px" width="50px">
            <i class="material-icons">arrow_drop_down</i>

            <div id="userOptions" style="background-color: white; border:solid 2px #67c9b3; position: absolute;
                width: auto; display: none;">
                <ul style="color: black">

                    <li style="padding: 0 5px;">
                        <a style="color: black" onclick="postRedirect('./users/view',{action:'closeSession'})">Log Out</a>
                    </li>

                    <li id="cerrar" style="padding: 0 5px; cursor: pointer">
                        <i class="small material-icons">arrow_drop_up</i>
                    </li>
                </ul>
            </div>
        </div>

        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li>
                <a href="https://github.com/Grupo-PW2/Lab08" target="_blank">
                    <svg style="width: 32px; height: 32px; margin: 20px 0" aria-labelledby="simpleicons-github-icon" roleKey="img" xmlns="http://www.w3.org/2000/svg">
                        <title id="simpleicons-github-icon">
                            GitHub icon
                        </title>
                        <path fill="white" d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12">
                        </path>
                    </svg>
                </a>
            </li>
            <li><a class="whiteLink" onclick="postRedirect('./roles')">Roles</a></li>
            <li><a class="whiteLink" onclick="postRedirect('../users')">Users</a></li>
            <li class="active"><a class="whiteLink" href="">Resources</a></li>
            <li><a class="whiteLink" onclick="postRedirect('./access')">Access</a></li>
            <li>|</li>
            <li><a class="whiteLink" onclick="postRedirect('./employees')">Employees</a></li>
            <li>|</li>
        </ul>

        <div class="dropdown hide-on-large-only" style="padding: 0 10px; font-weight: bold" onclick="toggleDropdown()">Show Services</div>
        <div id="dropdownContent">
            <a onclick="postRedirect('./roles')">Roles</a>
            <a onclick="postRedirect('./users')">Users</a>
            <a href="#" style="background-color: lightgray">Resources</a>
            <a onclick="postRedirect('./access')">Access</a>
        </div>

    </div>
</nav>

<div class="container">
    <br />
    <span style="font-size: xx-large; font-family: 'Product Sans',Roboto,serif">Resources</span>
    <br />
    <br />

    <%if (!serverResponse.equals("!")){ %>

    <div id="serverResponse">
        <div style="margin: 10px"></div>
    </div>
    <script>
        var respDiv = document.getElementById("serverResponse");
        var responseData = JSON.parse('<%=serverResponse%>');
        respDiv.style.backgroundColor = responseData["color"];
        respDiv.innerHTML = "<div style=\"margin: 10px\">" + responseData["response"] + "</div>";
        respDiv.style.maxHeight = "500px";
        setTimeout(function () {
            respDiv.style.maxHeight = "0";
        },1500);
    </script>

    <% } %>
    <br />
    <br />

    <a class="waves-effect waves-light btn whiteLink" onclick="postRedirect('/resources/add',{action:'redirect'})"><i class="material-icons left">add</i>Create</a>
    <br />
    <br />

    <table class="striped responsive-table">
        <thead>
            <tr>
                <td>URL</td>
                <td>Status</td>
                <td>Date created</td>
                <td>Actions</td>
            </tr>
        </thead>

        <tbody>

        <% for (int i = 0; i < resourceList.size(); i++) {%>
        <% Resource resource = resourceList.get(i); %>
        <% String key = resource.getKey();
            String[] arr = key.split("");
            key = "";
            for (String a : arr) {
                if (a.equals("\"")){
                    key += "&quot;";
                } else{
                    key += a;
                }
            }
        %>
        <tr>
            <td><%= resource.getUrl()%></td>
            <td><%= resource.getStatus()%></td>
            <td><%= resource.getCreateDate()%></td>
            <td>
                <a class="postLink" onclick="postRedirect('resources/view',{action:'viewRedirect',key:'<%=key%>'})">View</a>
                | <a class="postLink" onclick="postRedirect('resources/view',{action:'editRedirect',key:'<%=key%>'})">Edit</a>
                | <a class="postLink" onclick="postRedirect('resources/delete',{key:'<%=key%>'})">Delete</a></td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>
</body>
</html>