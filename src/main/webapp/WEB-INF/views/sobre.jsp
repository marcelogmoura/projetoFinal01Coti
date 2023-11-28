<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda WEB 1.0 - Cadastro</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />

    <link rel="stylesheet" href="<c:url value="/resources/styles.css" />">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .custom-bg {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>

<body class="bg-secondary">

    <!-- Navbar -->
    <jsp:include page="/WEB-INF/views/components/navbar.jsp"></jsp:include>

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 custom-bg text-center">

            <h2 class="text-center mb-4">. Sobre . </h2>
            <p class="text-center">Breve resumo</p>
                   
            <p>
        		- Esse sistema foi desenvolvido para o projeto Final 01/02 do curso Java WebDeveloper da Coti Informática.
            </p>
            
            <p>
                <strong>Objetivo: </strong> Desenvolver uma aplicação Spring MVC com banco de dados
							MySQL e FrontEnd utilizando Bootstrap + JQuery.
            </p>
            <p>
            

            <p>Link do enunciado completo em pdf:  
            	<a href="https://github.com/marcelogmoura/projetoFinal01Coti/" 
            		target="_blank"><i class="bi bi-file-earmark-pdf"></i></a></p>
            
            
            <p>Repositório no GitHub: 
            	<a href="https://github.com/marcelogmoura/projetoFinal01Coti/blob/main/projetoFinal01.pdf" 
            		target="_blank"><i class="bi bi-github"></i></a></p>
            
            

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</body>

</html>
