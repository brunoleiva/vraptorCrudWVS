<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>


<!-- TODO: Missing CoffeeScript 2 -->

<script>

	$(window).load(function() {

		var concelhos = $('select[name="Concelho"] option');
		$('select[name="Distrito"]').on('change', function() {
			var Distrito = this.value;
			var novoSelect = concelhos.filter(function() {
				return $(this).data('distrito') == Distrito;
			});
			$('select[name="Concelho"]').html(novoSelect);
		});

	});

</script>

</head>
<body>
	<select name="Distrito" size="1" width="180" class="COMBODISTCSS"
		id="COMBOFAB" tabindex="1">
		<option value="Indiferente">Indiferente</option>
		<option value="Aveiro">Aveiro</option>
		<option value="Beja">Beja</option>
		<option value="Braga">Braga</option>
	</select>
	<span class="IWLABEL11CSS" id="IWLABEL7">Concelho</span>

	<select name="Concelho" size="1" width="195" class="COMBOCONCCSS"
		id="COMBOCID" tabindex="1">
		<option data-distrito="Aveiro" value="Agueda">Agueda</option>
		<option data-distrito="Aveiro" value="Albergaria-a-Velha">Albergaria-a-Velha</option>
		<option data-distrito="Aveiro" value="Anadia">Anadia</option>
		<option data-distrito="Aveiro" value="Arouca">Arouca</option>
		<option data-distrito="Aveiro" value="Aveiro">Aveiro</option>
		<option data-distrito="Aveiro" value="Castelo de Paiva">Castelo
			de Paiva</option>
		<option data-distrito="Aveiro" value="Espinho">Espinho</option>
		<option data-distrito="Aveiro" value="Esterreja">Esterreja</option>
		<option data-distrito="Aveiro" value="Santa Maria da Feira">Santa
			Maria da Feira</option>
		<option data-distrito="Aveiro" value="Ilhavo">Ilhavo</option>
		<option data-distrito="Aveiro" value="Mealhada">Mealhada</option>
		<option data-distrito="Aveiro" value="Murtosa">Murtosa</option>
		<option data-distrito="Aveiro" value="Oliveira de Azemeis">Oliveira
			de Azemeis</option>
		<option data-distrito="Aveiro" value="Oliveira do Bairro">Oliveira
			do Bairro</option>
		<option data-distrito="Aveiro" value="Ovar">Ovar</option>
		<option data-distrito="Aveiro" value="Sao Joao da Madeira">São
			João da Madeira</option>
		<option data-distrito="Aveiro" value="Sever de Vouga">Sever
			de Vouga</option>
		<option data-distrito="Aveiro" value="Vagos">Vagos</option>
		<option data-distrito="Aveiro" value="Vale de Cambra">Vale de
			Cambra</option>
		<option data-distrito="Beja" value="Aljustrel">Aljustrel</option>
		<option data-distrito="Beja" value="Almodovar">Almodovar</option>
		<option data-distrito="Beja" value="Alvito">Alvito</option>
		<option data-distrito="Beja" value="Barrancos">Barrancos</option>
		<option data-distrito="Beja" value="Beja">Beja</option>
		<option data-distrito="Beja" value="Castro Verde">Castro
			Verde</option>
		<option data-distrito="Beja" value="Cuba">Cuba</option>
		<option data-distrito="Beja" value="Ferreira do Alentejo">Ferreira
			do Alentejo</option>
		<option data-distrito="Beja" value="Mertola">Mertola</option>
		<option data-distrito="Beja" value="Moura">Moura</option>
		<option data-distrito="Beja" value="Odemira">Odemira</option>
		<option data-distrito="Beja" value="Ourique">Ourique</option>
		<option data-distrito="Beja" value="Serpa">Serpa</option>
		<option data-distrito="Beja" value="Vidigueira">Vidigueira</option>
		<option data-distrito="Braga" value="Amares">Amares</option>
		<option data-distrito="Braga" value="Barcelos">Barcelos</option>
		<option data-distrito="Braga" value="Braga">Braga</option>
		<option data-distrito="Braga" value="Cabeceira de Bastos">Cabeceira
			de Bastos</option>
		<option data-distrito="Braga" value="Celorico de Bastos">Celorico
			de Bastos</option>
		<option data-distrito="Braga" value="Esposende">Esposende</option>
		<option data-distrito="Braga" value="Fafe">Fafe</option>
		<option data-distrito="Braga" value="Guimaraes">Guimarães</option>
		<option data-distrito="Braga" value="Povoa de Lanhoso">Povoa
			de Lanhoso</option>
		<option data-distrito="Braga" value="Terra de Bouro">Terra de
			Bouro</option>
		<option data-distrito="Braga" value="Vieira do Minho">Vieira
			do Minho</option>
		<option data-distrito="Braga" value="Vila Nova de Famalicão">Vila
			Nova de Famalicão</option>
		<option data-distrito="Braga" value="Vila Verde">Vila Verde</option>
		<option data-distrito="Braga" value="Vizela">Vizela</option>
	</select>


</body>
</html>
