// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require prettify
//= require_tree .
//= require nice_jquery

$().ready(function(){
	prettyPrint();
	$('.nav-tabs').button();
	
	var $win = $(window)
	      , navTop = $('.subnav').length && $('.subnav').offset().top - 40
	      , isFixed = 0;
	
	$win.on('scroll', function () {
	      var i, scrollTop = $win.scrollTop();
	
	      if (scrollTop >= navTop && !isFixed) {
	        isFixed = 1
	        $(".subnav").addClass('subnav-fixed')
	      } else if (scrollTop <= navTop && isFixed) {
	        isFixed = 0
	        $(".subnav").removeClass('subnav-fixed')
	      }
	    });
});
