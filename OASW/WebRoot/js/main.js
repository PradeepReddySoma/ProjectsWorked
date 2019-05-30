$(document).ready(function(){

  $('#left_content > ul > li:has(ul)').addClass("has-sub");

  $('#left_content > ul > li > a').click(function() {
    var checkElement = $(this).next();
    
    $('#left_content li').removeClass('active');
    $(this).closest('li').addClass('active');	
    
    
    if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
      $(this).closest('li').removeClass('active');
      checkElement.slideUp('normal');
    }
    
    if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
      $('#left_content ul ul:visible').slideUp('normal');
      checkElement.slideDown('normal');
    }
    
    if (checkElement.is('ul')) {
      return false;
    } else {
      return true;	
    }		
  });

  
  
});