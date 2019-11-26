$(document)
		.ready(
				function() {

					function iniciartablamodal() {

						$('#servm .itemprecio')
								.each(
										function() {

											$(this)
													.dblclick(
															function() {

																$('#carrito')
																		.append(
																				$(this));
																console
																		.log("modal")

																$("#Total")
																		.val(
																				parseInt($(
																						this)
																						.children()[2].innerText)
																						+ parseInt($(
																								"#Total")
																								.val()));
																iniciartablagrande();
																$('#Totalizar').removeAttr('disabled');
															})

										});
					}

					function iniciartablagrande() {
						$('#TablaGrande .itemprecio')
								.each(
										function() {
											$(this)
													.dblclick(
															function() {

																$('#servm')
																		.append(
																				$(this));
																console
																		.log("tabla grande")
																$("#Total")
																		.val(
																				parseInt($(
																						this)
																						.children()[2].innerText)
																						- parseInt($(
																								"#Total")
																								.val()));
																iniciartablamodal();

															})

										});

					}

					iniciartablamodal();
					iniciartablagrande();

					$("#TotalTotal").click(function(e) {
						e.preventDefault();

						var datos = $("#CrearLiquidar").serialize();
						var Nroturno = "&"+$("#Buscar").serialize();
						var Total = "&"+$("#Total").serialize();
						var Servs = [];
						var items = $('#TablaGrande .itemprecio');
						for (var i = 0; i < items.length; i++) {

							// for (var j = 0; j < items[0].children.length;
							// j++) {
							// console.log(items[i].children[j].innerText);

							// }

							var ID = items[i].children[0].innerText;
							

							Servs.push(ID);
						}
console.log(Servs);

var woof = "";

for (var i = 0; i < Servs.length; i++) {
woof+= "&"+"Servicio="+ Servs[i];	
}
console.log (woof);
//test=3&test=4
var Bigdata = datos+Nroturno+woof
console.log(Nroturno);
console.log(datos);
console.log(Bigdata);
						// $('#TablaGrande
						// .itemprecio')[0].children[0].innerText
						
						 $.post("../ControladorLiquidar?"+ Bigdata, function
						 (res,est,jqXHR){

						 console.log (res);
						 if (res == "true") {

						 alert("Se cambio la 'Vuelta' exitosamente");
						 document.location.reload(true);
						 } else {

						 alert("no se hizo nada");

						 }

						 });
					});
					// var totals=[0,0,0];
					// $(document).ready(function(){

					// var $dataRows=$("#TablaGrande tr:not('.totalColumn,
					// .titlerow')");

					// $dataRows.each(function() {
					// $(this).find('.rowDataSd').each(function(i){
					// totals[i]+=parseInt( $(this).html());
					// });
					// });
					// $("#sum_table td.totalCol").each(function(i){
					// $(this).html("total:"+totals[i]);
					// });

					// });

				});