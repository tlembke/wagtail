// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dresssed
//= require turbolinks
//= require dresssed
//= require editable/bootstrap-editable
//= require editable/rails
//= require_tree .

$('.editable').editable();

$('#condition').on('change', function() {
	if ($(this).val()=="New..."){
  		$('#myModal').modal('show');
  }
  else if ($(this).val()!=""){
      // save
      var condition_id=$(this).val();
      // name of select is person
      var person_id=$('#condition').attr('name');
      $('#conditions').find('ul').append("<li>"+$( "#condition option:selected" ).text()+"</li>");
      $.ajax({
        type: "PATCH",
        url: "/people/"+person_id+"/add_condition",
        data: { condition: condition_id}
      });
  }
});



$('#myModal').on('shown.bs.modal', function () {
    $('#new_condition').focus()
  });

$('#myModal').on('hidden.bs.modal', function (e) {
    if ($('#new_condition').val()!=""){
     $('#conditions').find('ul').append("<li>"+$('#new_condition').val()+"</li>");
    	$.ajax({
      	type: "POST",
      	url: "/conditions",
      	data: { condition: { name: $('#new_condition').val()},person: $('#modal_person').val() },
      });

	  };
});


