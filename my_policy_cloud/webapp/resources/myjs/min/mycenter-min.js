$(document).ready(function(){$("#myinfo").click(function(){$(this).siblings().removeClass("active").addClass("active"),$("#myContent").load("/mycenter/myinfo")}),$("#changemypwd").click(function(){$(this).siblings().removeClass("active").addClass("active"),$("#myContent").load("/mycenter/changemypwd")})});