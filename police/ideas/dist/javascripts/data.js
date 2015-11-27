$(function(){
	function getData() {
	    $.getJSON("data/data.json", function(data) {
	        $.each(data.comments, function(i, item) {
	            $("#data-box").append(
                    "<tr>" +
                    "<td>" + item.id + "</td>" + 
                    "<td>" + item.time + "</td>" + 
                    "<td>" + item.name + "</td>" + 
                    "<td>" + item.phone + "</td>" + 
                    "<td>" + item.alarm + "</td>" + 
                    "<td>" + item.adr + "</td>" + 
                    "<td>" + item.wename + "</td>" + 
                    "<td>" + item.wenum + "</td>" + 
                    "</tr>");
	        	});
	        });
	}

	getData();
})