<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
      	<meta name="viewport" content="width=device-width, initial-scale=1">
      	
      	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.js"></script>
		
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>      	
      	
      	<title>PayPal Demo Portal</title>
      
      	<!--Including Bootstrap style files-->
      	<link href="css/bootstrap.min.css" rel="stylesheet">
      	
		<style>
            tr {
                line-height: 30px;
            }
            td {
                padding: 5px;
            }

            .divBorder {
	            margin-top:10px;
	            border: #cccccc medium solid;
	            border-radius: 10px;
	            -moz-border-radius: 10px;
	            -webkit-border-radius: 10px;
                padding: 15px;
                margin-bottom: 15px;
            }
            
            .colCentered {
			    float: none;
			    margin: 0 auto;
			}

			.loader {
				border: 4px solid #d0d0d0; /* Light grey */
			    border-top: 4px solid #3498db; /* Blue */
			    border-radius: 50%;
			    width: 28px;
			    height: 28px;
			    animation: spin 1s linear infinite;
			}
			
			@keyframes spin {
			    0% { transform: rotate(0deg); }
			    100% { transform: rotate(360deg); }
			}   
			
			.mark {
				height: 40px;
			}
			
			/* http://angrytools.com/gradient/ */
			.bg-color {
				color: white;
				background: -moz-linear-gradient(0deg, #004094 0%, #0096D9 50%, #004094 100%); /* ff3.6+ */
				background: -webkit-gradient(linear, left top, right top, color-stop(0%, #004094), color-stop(50%, #0096D9), color-stop(100%, #004094)); /* safari4+,chrome */
				background: -webkit-linear-gradient(0deg, #004094 0%, #0096D9 50%, #004094 100%); /* safari5.1+,chrome10+ */
				background: -o-linear-gradient(0deg, #004094 0%, #0096D9 50%, #004094 100%); /* opera 11.10+ */
				background: -ms-linear-gradient(0deg, #004094 0%, #0096D9 50%, #004094 100%); /* ie10+ */
				background: linear-gradient(90deg, #004094 0%, #0096D9 50%, #004094 100%); /* w3c */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#004094', endColorstr='#004094',GradientType=1 ); /* ie6-9 */
			}
			
			a.light-links, a.light-links:hover, a.light-links:active, a.light-links:visited { 
				color: white; 
				text-decoration: underline;
			}
			
        </style>
      	
  	</head>
  	
  	
	<body>

		<div class="container-fluid">

            <div class="well bg-color">
                <h2 class="text-center">Express Checkout via Braintree SDK - <a href="index.jsp#readme" class="light-links">Readme</a></h2>
            </div>
            
        </div>
        