// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

$(function(){

    $("#appointment_doctor_name").autocomplete({
    	source: $("#appointment_doctor_name").data("autocomplete-source")
	  })

    $("#appointment_tab_user_name").autocomplete({
    	source: $("#appointment_tab_user_name").data("autocomplete-source")
	})


    $("#appointment_medical_shop_name").autocomplete({
    	source: $("#appointment_medical_shop_name").data("autocomplete-source")
	})


    $("#doctor_name_check").bind('change', function(){
			if(this.checked){
			$("#appointment_doctor_name").show();
			$("#medical_shop_check").attr("disabled","disabled");
			}
			else{
			$("#appointment_doctor_name").hide();
				$("#medical_shop_check").removeAttr("disabled","disabled");
			}
		})

		  $("#medical_shop_check").bind('change', function(){
				if(this.checked){
				$("#appointment_medical_shop_name").show();
				$("#doctor_name_check").attr("disabled","disabled");
				}
				else{
				$("#appointment_medical_shop_name").hide();
				$("#doctor_name_check").removeAttr("disabled","disabled");
				}
		})

				$("#start_survey_button").on("click",function() {
					// body...
					$("#survey_report_form").toggle();
					$("#start_survey_button").hide();
				})

				$("#report_sample_given_true").on("click",function(){
					$("#sample_value").show();
				})
				
				$("#report_sample_given_false").on("click",function(){
					$("#sample_value").hide();
				})


})
