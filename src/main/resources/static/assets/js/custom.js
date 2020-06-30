$(document).ready(
		function() {
			// dismiss 3 seconds alert
			var $alert = $('.alert');

			if ($alert.length) {
				setTimeout(function() {
					$alert.alert('close')
				}, 3000);
			}
			// açılan modal kapatılınca sıfırlamak için
			$(".modal").on("hidden.bs.modal", function() {
				$(this).find('form').trigger('reset');
			});

			
			

		});
