/*
* Copyright (C) 2009 Joel Sutherland.
* Liscenced under the MIT liscense
*/
(function(a){a.fn.filterable=function(b){return b=a.extend({useHash:!0,animationSpeed:1e3,show:{width:"show",opacity:"show"},hide:{width:"hide",opacity:"hide"},useTags:!0,tagSelector:"#portfolio-filter a",selectedTagClass:"current",allTag:"all"},b),a(this).each(function(){a(this).bind("filter",function(c,d){b.useTags&&(a(b.tagSelector).removeClass(b.selectedTagClass),a(b.tagSelector+"[href="+d+"]").addClass(b.selectedTagClass)),a(this).trigger("filterportfolio",[d.substr(1)])}),a(this).bind("filterportfolio",function(c,d){d==b.allTag?a(this).trigger("show"):(a(this).trigger("show",["."+d]),a(this).trigger("hide",[":not(."+d+")"])),b.useHash&&(location.hash="#"+d)}),a(this).bind("show",function(c,d){a(this).children(d).animate(b.show,b.animationSpeed)}),a(this).bind("hide",function(c,d){a(this).children(d).animate(b.hide,b.animationSpeed)}),b.useHash&&(location.hash!=""?a(this).trigger("filter",[location.hash]):a(this).trigger("filter",["#"+b.allTag])),b.useTags&&a(b.tagSelector).click(function(){a("#portfolio").trigger("filter",[a(this).attr("href")]),a(b.tagSelector).removeClass("current"),a(this).addClass("current")})})}})(jQuery),$(document).ready(function(){$("#portfolio").filterable()});