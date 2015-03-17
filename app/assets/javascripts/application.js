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
//= require bootbox
//= require_tree .

$('.editable').editable();



// ----------------------------------
// Condition Add
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

// ----------------------------------


// ----------------------------------
// Craft Add
$('#craftpicker').on('change', function() {
  if ($(this).val()=="New..."){
      $('#craftModal').modal('show');
  }
});



$('#craftModal').on('shown.bs.modal', function () {
    $('#new_craft').focus()
  });

$('#craftModal').on('hidden.bs.modal', function (e) {
    if ($('#new_craft').val()!=""){
     //$('#conditions').find('ul').append("<li>"+$('#new_condition').val()+"</li>");
      $.ajax({
        type: "POST",
        url: "/crafts",
        data: { craft: { name: $('#new_craft').val()} },
      });

    };
});

// ----------------------------------

// ----------------------------------
// Location Add
$('#locationpicker').on('change', function() {

  if ($(this).val()=="0"){
      $.ajax({
        type: "GET",
        url: "/organisations/newlocation",
      });
  }
  else{
      $.ajax({
        type: "GET",
        url: "/organisations/"+$( "#locationpicker option:selected" ).val()+"/change",
      });
  }
});



// ----------------------------------
// Team Member Add
$('#teampicker').on('change', function() {
  if ($(this).val()=="New..."){
      $('#myModal').modal('show');
  }
  else if ($(this).val()!=""){
      // save
      var provider_id=$(this).val();
      // name of select is person
      var person_id=$('#teampicker').attr('name');
      $.ajax({
        type: "PATCH",
        url: "/people/"+person_id+"/add_team_member",
        data: { provider: provider_id}
      });
  }
});

  $(document).on('click','[data-toggle=confirmation]',function(event) {
    var provider = $(this).data('provider'); 
    var person = $(this).data('person'); 
    var $row = $(this).closest("tr");
    bootbox.confirm("Are you sure you want to remove team member?",function(result) {
      if (result){
        $row.remove();
        $.ajax({
          type: "PATCH",
          url: "/people/"+person+"/remove_team_member",
          data: { provider: provider}
        });
      }
      else{
        alert("OK, I won't");
      }
    }); 
  });


