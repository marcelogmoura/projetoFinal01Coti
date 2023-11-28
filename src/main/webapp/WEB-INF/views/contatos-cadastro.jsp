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
    <!-- CSS personalizado  -->
    <link rel="stylesheet" href="<c:url value="/resources/styles.css" />">

    <!-- CSS para mensagens de erro de validação -->
    <style>
        label.error { color: #f46e56; }
        input.error { border: 2px solid #f46e56; }
    </style>

    <!-- estilos específicos para a página "Cadastro" -->
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
        <div class="card p-4 custom-bg" > 

			<img src="${pageContext.request.contextPath}/resources/images/agenda.png" 
				 alt="Agenda" 
				 style="max-width: 240px; max-height: 240px; 
				 display: block; margin: 0 auto"> <br>
			

            <h2 class="text-center mb-4">Cadastro de Contatos</h2>
            <p class="text-center">Preencha os campos abaixo.</p>

            <c:if test="${not empty mensagem}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong> :)</strong> ${mensagem}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form id="formCriarContato" method="post" action="contatos-cadastro-post">
                <div class="mb-2">
                    <label for="nome" class="form-label"> <i class="bi bi-person"></i> Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome do contato">
                </div>
                <div class="mb-2">
                    <label for="Email" class="form-label"> <i class="bi bi-mailbox"></i> Email:</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="Email do contato">
                </div>
                <div class="mb-2">
                    <label for="Telefone" class="form-label"> <i class="bi bi-telephone"></i> Telefone:</label>
                    <input type="text" class="form-control" id="telefone" name="telefone" placeholder="Telefone do contato" >
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-light">Salvar</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery  -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- jQuery Validation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
    
    

    <script>
    $(document).ready(function () {
        $("#formCriarContato").validate({
            rules: {
                "nome": {
                    required: true,
                    minlength: 3,
                    maxlength: 100
                },
                "email": {
                    required: true,
                    email: true
                },
                "telefone": {
                    required: true,
                    minlength: 8,
                    maxlength: 8,
                    pattern: /^[0-9]{8}$/ // Adicione o padrão aqui
                },
            },
            messages: {
                "telefone": {
                    pattern: "Apenas números, com 8 dígitos"
                }
            }
        });
    });

    </script>
    
    



</body>

</html>
