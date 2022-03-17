$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.armor == 100) {
            $("#armor").show();
		} else if (data.armor > 10) {
            $("#armor").show();
			$("#boxArmor").css("width", data.armor + "%");
		} else if (data.armor <= 10) {
			$("#armor").show();
			$("#boxArmor").css("width", data.armor + "%");
		}

        if (data.health != -100){
			$('#healtlevel').html(Math.round(data.health))
		}else if(data.health == 0){
			$('#healtlevel').html("0")
		}

		if (data.armor != -100){
			$('#armorlevel').html(Math.round(data.armor))
		}else if(data.armor == 0){
			$('#armorlevel').html("0")
		}
    })
})

	$(function() {
	var $heal = $("#heal");
	var $box = $("#box");
	var $boxArmor = $("#boxArmor");

	window.addEventListener('message', function(event){
		$box.css("width", (event.data.heal-100) + "%");
		$boxArmor.css("width", (event.data.armor) + "%");
	}); 
});
