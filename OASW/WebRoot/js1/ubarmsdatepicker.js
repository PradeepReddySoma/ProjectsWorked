
	$(function() {
		
		$( "#accordion" ).accordion();
		

		
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#autocomplete" ).autocomplete({
			source: availableTags
		});
		

		
		$( "#button" ).button();
		$( "#button1" ).button();
		$( "#button2" ).button();
		$( "#button3" ).button();
		
		$( "#button4" ).button();
		$( "#button5" ).button();
		$( "#button6" ).button();
		$( "#button7" ).button();
		
		$( "#button8" ).button();
		$( "#button9" ).button();
		$( "#button10" ).button();
		$( "#button11" ).button();
		$( "#button12" ).button();
		$( "#button13" ).button();
		$( "#button14" ).button();
		$( "#button15" ).button();
		$( "#button16" ).button();
		$( "#button17" ).button();
		$( "#button18" ).button();
		$( "#button19" ).button();
		$( "#button20" ).button();
		$( "#button21" ).button();
		$( "#button22" ).button();
		$( "#button23" ).button();
		$( "#button24" ).button();
		$( "#button25" ).button();
		$( "#button26" ).button();
		$( "#button27" ).button();
		$( "#button28" ).button();
		$( "#button29" ).button();
		$( "#button30" ).button();
		$( "#button31" ).button();
		$( "#button32" ).button();
		$( "#button33" ).button();
		$( "#button34" ).button();
		$( "#button35" ).button();
		$( "#button36" ).button();
		$( "#button37" ).button();
		$( "#button38" ).button();
		$( "#button39" ).button();
		$( "#button40" ).button();
		$( "#button41" ).button();
		$( "#button42" ).button();
		$( "#button43" ).button();
		
		$( "#radioset" ).buttonset();
		

		
		$( "#tabs" ).tabs(2);
		

		
		$( "#dialog" ).dialog({
			autoOpen: false,
			width: 400,
			buttons: [
				{
					text: "Ok",
					click: function() {
						$( this ).dialog( "close" );
					}
				},
				{
					text: "Cancel",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		});

		// Link to open the dialog
		$( "#dialog-link" ).click(function( event ) {
			$( "#dialog" ).dialog( "open" );
			event.preventDefault();
		});
		

		
		
			$( "#datepicker" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,
			});
			
			
			$( "#datepicker1" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,
			});
			$( "#datepicker2" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});

			$( "#datepicker3" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});

			$( "#datepicker4" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker5" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker6" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker7" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker8" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker9" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			
			$( "#datepicker10" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker11" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker12" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			
			$( "#datepicker13" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker14" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker15" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker16" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker17" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			
			$( "#datepicker18" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker19" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker20" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker21" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			
			$( "#datepicker22" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker23" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker24" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});
			$( "#datepicker25" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true
			});

			$( "#datepicker26" ).datepicker({
				inline: true

			});

				$( "#datepicker27" ).datepicker({
					dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly:false
			});
				$( "#datepicker28" ).datepicker({
					dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly:false
			});
				$( "#datepicker29" ).datepicker({
					dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly:false
			});
				$( "#datepicker30" ).datepicker({
					dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly:false
			});
				$( "#datepicker31" ).datepicker({
					dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly:false
			});

			$( "#datepickermcr" ).datepicker({
				dateFormat:"dd/mm/yy",
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,
			});
			
			
			$('#datepicker55').datepicker({
				changeMonth: true,
				changeYear: true,
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,
				dateFormat: 'mm/yy',
				onClose: function(dateText, inst) {
				var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				$(this).datepicker('setDate', new Date(year, month, 1));
					},
				beforeShow: function(input, inst) {
				if ((datestr = $(this).val()).length > 0) {
				year = datestr.substring(datestr.length - 4, datestr.length);
				month = jQuery.inArray(datestr.substring(0, datestr.length - 5), $(this).datepicker('option', 'monthNames'));
				$(this).datepicker('option', 'defaultDate', new Date(year, month, 1));
				$(this).datepicker('setDate', new Date(year, month, 1));
				}
				}
				});
		$('#datepicker33').datepicker({
				changeMonth: true,
				changeYear: true,
				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,
				dateFormat: 'yy',
				onClose: function(dateText, inst) {
				
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				$(this).datepicker('setDate', new Date(year,  1));
					},
				beforeShow: function(input, inst) {
				if ((datestr = $(this).val()).length > 0) {
				year = datestr.substring(datestr.length - 4, datestr.length);
				
				$(this).datepicker('option', 'defaultDate', new Date(year, 1));
				$(this).datepicker('setDate', new Date(year,  1));
				}
				}
				});
		
		$( "#slider" ).slider({
			range: true,
			values: [ 17, 67 ]
		});
		

		
		$( "#progressbar" ).progressbar({
			value: 0
		});
		$( "#progressbar1" ).progressbar({
			value: 0
		});
		$( "#progressbar2" ).progressbar({
			value: 0
		});
		$( "#progressbar3" ).progressbar({
			value: 0
		});
		$( "#progressbar4" ).progressbar({
			value: 0
		});
		$( "#progressbar5" ).progressbar({
			value: 0
		});
		$( "#progressbar6" ).progressbar({
			value: 0
		});
		$( "#progressbar7" ).progressbar({
			value: 0
		});
		$( "#progressbar8" ).progressbar({
			value: 0
		});
		$( "#progressbar9" ).progressbar({
			value: 0
		});
		
		

		// Hover states on the static widgets
		$( "#dialog-link, #icons li" ).hover(
			function() {
				$( this ).addClass( "ui-state-hover" );
			},
			function() {
				$( this ).removeClass( "ui-state-hover" );
			}
		);
	});