// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(function() {
  $("#tasks-table th a, #tasks-table .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});

function render_buttons(button, id) {
  if(button.classList.contains("upvote-comment")){
    if(button.classList.contains("glyphicon-green")){
      button.classList.remove("glyphicon-green");
    }
    else{
      button.className += " glyphicon-green";
      button.nextElementSibling.classList.remove("glyphicon-red");
    }
  }
  else {
    if(button.classList.contains("glyphicon-red")){
      button.classList.remove("glyphicon-red");
    }
    else{
      button.className += " glyphicon-red";
      button.previousElementSibling.classList.remove("glyphicon-green");
    }
  }
}
