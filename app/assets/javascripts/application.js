// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// // vendor/assets/javascripts directory can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // compiled file. JavaScript code in this file should be added after the last require_* statement.
// //
// // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// // about supported directives.
// //
// //= require jquery
// //= require jquery_ujs
// //= require bootstrap-sprockets

// // require rails-ujs
// //= require_tree .

$( document ).ready(function (){
    $('.unlike').on("click", function(){
    		$('.glyphicon-heart').css("color", "lightgrey")})})
    	 
$( document ).ready(function (){
    $('.like').on("click", function(){
    		$('.glyphicon-heart').css("color", "red")})})
    
// $( document ).ready(function (){
//     $('.glyphicon-heart').on("click", function(){
//     	if ($('.glyphicon-heart').css("color") == 'rgb(255, 0, 0)') 
//     	{
//     		$('.glyphicon-heart').css("color", "lightgrey") 
//     	} 

//     	else {
//     		$('.glyphicon-heart').css("color", "red") 
//     	}
//     });
//    });
