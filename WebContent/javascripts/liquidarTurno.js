$(document).ready(function() {



	
	
	$('.itemprecio').each(function(){
	
		
		$(this).dblclick(function(){ 
			
			$('#carrito').append($(this));
	
		$("#Total").val(parseInt($(this).children()[1].innerText)+parseInt($("#Total").val()));

		})
		
		});
	
	
	$('#carrito').each(function(){
		$(this).dblclick(function(){ 
		
			$('#carritoMayor').append($(this));
			
		})
		
		});
	
	
		
//	 var totals=[0,0,0];
//     $(document).ready(function(){

//         var $dataRows=$("#TablaGrande tr:not('.totalColumn, .titlerow')");

//         $dataRows.each(function() {
//             $(this).find('.rowDataSd').each(function(i){        
//                 totals[i]+=parseInt( $(this).html());
//             });
//         });
//         $("#sum_table td.totalCol").each(function(i){  
//             $(this).html("total:"+totals[i]);
//         });

//     });
	
	
});