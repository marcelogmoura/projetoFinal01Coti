<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link  href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- CSS erro de validação -->
	<style>
	label.error {color: #990000;}
	input.error {border: 2px solid #990000;}
	</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agenda WEB 1.0 - Consulta</title>

</head>
	<body class="bg-secondary">

	<!--  navbar -->
	<jsp:include page="/WEB-INF/views/components/navbar.jsp"></jsp:include>


	<div class="container mt-4">
		<div class="card">
			<div class="card-body">
					<h4 class="text-center"><i class="bi bi-search"></i> Consultar contatos  </h4>
					<p class="text-center"><i class="bi bi-person"></i> Pesquise pelo nome.</p>
					<hr/>
				
				<form id="formConsulta" action="contatos-consulta-post" method="post">
				
					<div class="row mb-2">
							
						<div class="col-md-3">
							<input 
								type="text"
								id="nome"
								name="nome"
								class="form-control"
								placeholder="Digite o nome"	
								value="${nome}"/>
						</div>
												
						<div class="col-md-8">
							<button 
								type="submit" 
								class="btn btn-outline-success">	
							<i class="bi bi-search"></i> Pesquisar
							</button>
							
							<input 
								type="button" 
								value="Limpar Pesquisa" 
								id="limparPesquisa" 
								class="btn btn-outline-success" />
							
						</div>
						
						</div>
				
				</form>	
				
				<strong style="color: #F87678;">
				${mensagem}	
				${mensagem_erro}
				${mensagem_atencao}				
				</strong>		
		
					<div class="mt-3 table-responsive">
					
						<table id="tabela" class="table table-sm">
						
							<thead>
								<tr>
									<th>Nome </th>
									<th>e-mail </th>
									<th>Telefone </th>
									<th>Ações </th>
								</tr>
							</thead>							
							<tbody>		
							
				<c:forEach items="${lista_contatos}" var="item">
					
								<tr>
									<td> ${item.nome} </td>
									<td> ${item.email} </td>
									<td> ${item.telefone} </td>
									<td>							
										<a href="/projetoFinal01/contatos-edicao?idContato=${item.idContato}" 
											class="btn btn-outline-warning"> 
										Editar	</a>
										
										<a href="/projetoFinal01/contatos-excluir?idContato=${item.idContato}" 
											class="btn btn-outline-danger"
											onclick="return confirm('Excluir contato? ${item.nome}')" > 
										Excluir </a>
									</td>
								</tr>
				 
			</c:forEach>
															
							</tbody>
						</table>
					</div>
				
	
			</div>			
		</div>
	</div>
		
		<!-- bootstrap -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script> 

		<!-- jquery -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		
		<!-- jquery  validation -->
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>


		<!-- datatable -->
		<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
		
		

		<script>
		    $(document).ready(function() {
		        $("#formConsulta").validate({
		            rules: {
		                "nome": {
		                    required: true,
		                    minlength: 2
		                },
		            },
		            
		            messages: {
		                "nome": {
		                    required: "Esse campo não pode ser vazio para uma pesquisa.",
		                    minlength: "O nome deve conter pelo menos 2 caracteres"
		                },
		            },
		        });
		        
		   		$("#tabela").DataTable({
		   			language: {
		   				url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/pt-BR.json'
		   			}
		   		});
		   		
				$("#limparPesquisa").click(function() {
		            $("#nome").val('');
		            $("#tabela tbody").empty();
		        });
		   		
		        
		    });
		</script>
		
		




</body>
</html>



