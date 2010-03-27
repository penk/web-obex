		function scan_hci() {
			$('#content').html('<img src="images/load.gif">'); // loading indicator
			$('#download').attr('disabled', true); // disable download button 
			$('#download_all').attr('disabled', true);
			$.get("http://localhost/cgi-bin/scan.pl", function(data){ // list scanning results
				$('#content').html(data);
			});
		}

		function list_hci(input) {
			$('#content').html('<img src="images/load.gif">'); // loading indicator
			$.get("http://localhost/cgi-bin/list.pl?"+input, function(data){
				$('#content').html(data); // list files
				$('#download').attr('disabled', false); // enable download button 
				$('#download_all').attr('disabled', false);
			});
		}

		function download_hci() {
			var file_list = '';
			var mac = '';
			$('#download').attr('disabled', true); // disable download button 
			$('#download_all').attr('disabled', true);
			$("input:checked").each(function(){ // iterating of checked checkbox
				file_list += $(this).val()+'+'; 
				mac = $(this).attr('name'); // get mac address 
			});

			$('#content').html('<img src="images/load.gif">'); // loading indicator
			$('#content').append('<p>Downloading file from ' + mac + '...');
			$.get("http://localhost/cgi-bin/get.pl?"+ mac +'+'+file_list, function(data){
				$('#content').html(data); // fetch files
			});
		}

		function download_all() {
			$('input:checkbox').attr('checked', true);
			download_hci();
		}

		function file_hci() {
			$.get("http://localhost/cgi-bin/file.pl", function(data){
				$('#content').html(data); // list local files
			});
		}

		function play(input) {
			$.get("http://localhost/cgi-bin/play.pl?"+input);
			$('#play').hide();
			$('#stop').show();
			$('#content').html('Playing music ...');
		}

		function stop() {
			$.get("http://localhost/cgi-bin/jswrapper?killall mplayer");
			$('#play').show();
			$('#stop').hide();
			file_hci();
		}
