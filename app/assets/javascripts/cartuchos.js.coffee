# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
#	$('#impresoras').parent().hide()
#	  printer = $('#impresoras').html()
#	  $('#brand').change ->
#	    marca = $('#brand :selected').text()
#	    escaped_marca = marca.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#	    options = $(printer).filter("optgroup[label='#{escaped_marca}']").html()
#	    if options
#	      $('#impresoras').html(options)
#	      $('#impresoras').parent().show()
#	    else
#	      $('#impresoras').empty()
#	      $('#impresoras').parent().hide()
 	$("#mensaje").hide();
jQuery -> 
$('#agregar_form').submit ->	
	#$('#mensaje').dialog()
	$('#mensaje').show()
 
	