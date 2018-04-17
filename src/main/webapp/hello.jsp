<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Homepage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body>


	<!-- Button trigger modal -->
	<div style="padding: 20px;">
		<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#saveNewPerson">Add Person</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="saveNewPerson" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add new person</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" class="form-control" id="name" placeholder="Enter person name">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" id="email"  placeholder="Enter person email">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="savePerson()">Save new person</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	var name = $("#name").val("");
	var email = $("#email").val("");
	
	function savePerson(){
		var name = $("#name").val();
		var email = $("#email").val();
		
		
		var settings = {
				  "async": true,
				  "crossDomain": true,
				  "url": "http://localhost:8080/addperson",
				  "method": "POST",
				  "headers": {
				    "Content-Type": "application/json",
				    "Cache-Control": "no-cache",
				    "Postman-Token": "fc593ed8-2910-4416-9e57-cd9fdee9c87f"
				  },
				  "processData": false,
				  "data": "{\"name\":  \""+ name +"\",\"email\": \""+ email +"\"}"
				}

				$.ajax(settings).done(function (response) {
				  console.log(response.length);
				});
		
		
	}
	
	</script>

	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${persons}" var="person">
				<tr>
					<td>${person.name}</td>
					<td>${person.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>