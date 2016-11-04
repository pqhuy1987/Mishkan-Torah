 var _version = "1.42";
 
 
 $(window).on('load', function() {
	 
	 
	 
    $('iframe[id^=twitter-widget-]').each(function () {
        var head = $(this).contents().find('head');
        if (head.length) {
            head.append('<style>.timeline { max-width: 100% !important; width: 100% !important; height:100% !important; } .timeline .stream { max-width: none !important; width: 100% !important; }</style>');
    }
        $('#twitter-widget-0').append($('<div class=timeline>'));
        
        var windowHeight = $(window).height();
        $('iframe[id^=twitter-widget-]').css('height', windowHeight - 65);
    })
});

$(document).ready(function () {
 
 
    // are we running in native app or in a browser?
    window.isphone = false;
    if (document.URL.indexOf('http://') === -1 && document.URL.indexOf('https://') === -1) {
        window.isphone = true;
    }
  
    if (window.isphone) {
		 
		onDeviceReady();
        //document.addEventListener('deviceready', onDeviceReady, false);
    } else {
		 
        onDeviceReady();
    }
	
	
	
});

function onDeviceReady() {
 
			_app ={};
			_app._version = _version;
			 
			$.ajax({
				type: 'GET',
				data: {_app:_app},
				dataType:'JSON',
				url: 'http://app.fidem.am/kollel/index.php',
				success: function(response){
									 
													if(response._version == "valid")
													{
													 
														$("#update").hide();
													
													}
												     else {
													 
														$("#update").show();
														 
														$("#container").css("display","none");
														
													}
													
													$("#loading").css("display","none");
														
												
													
											}
			
			});
			
}

 

 
	
   

   

 