(function( window , document ){

	'use strict';

	(function(){
		//根据devicePixelRatio自定计算scale
		//可以有效解决移动端1px这个世纪难题。
		var viewport = document.querySelector('meta[name="viewport"]'),
			dpr = window.devicePixelRatio || 1,
			scale = 1 / dpr,
			ua = window.navigator.userAgent.toLowerCase(),
			isIPhoneWeixin = (function(){
				return (ua.indexOf('iphone') > 0 ) && (ua.indexOf('micromessenger') > 0);
			})();

		if( isIPhoneWeixin ){ scale = 1 }

		var content = 'width=device-width, initial-scale='+ scale +', minimum-scale='+ scale +', maximum-scale='+ scale +', user-scalable=no';


		if( isIPhoneWeixin ){

			var style = document.createElement('style');

			style.innerHTML = 'html{transform:scale('+ 1/dpr +'); webkit-transform:scale('+ 1/dpr +'); transform-origin:0 0; webkitTransform-origin:0 0; } body{ transform:scale('+ dpr +'); webkit-transform:scale('+ dpr +'); transform-origin:0 0; webkitTransform-origin:0 0; }';

			viewport = document.createElement('meta');
			viewport.setAttribute('name', 'viewport');
			viewport.setAttribute('content', content);
			document.head.appendChild( viewport );
			document.head.appendChild( style );

			return false;
		}


		if( viewport ){
			viewport.setAttribute('content', content);
		}else{
			viewport = document.createElement('meta');
			viewport.setAttribute('name', 'viewport');
			viewport.setAttribute('content', content);
			document.head.appendChild( viewport );
		}

	})();

	//给hotcss开辟个命名空间，别问我为什么，我要给你准备你会用到的方法，免得用到的时候还要自己写。
	var hotcss = {};

	hotcss.px2rem = function( px , designWidth ){
		//预判你将会在JS中用到尺寸，特提供一个方法助你在JS中将px转为rem。就是这么贴心。
		if( !designWidth ){
			//如果你在JS中大量用到此方法，建议直接定义 hotcss.designWidth 来定义设计图尺寸;
			//否则可以在第二个参数告诉我你的设计图是多大。
			designWidth = parseInt(hotcss.designWidth , 10);
		}

		return parseInt(px,10)*320/designWidth/20;
	}

	hotcss.mresize = function(){
		//对，这个就是核心方法了，给HTML设置font-size，三行足矣。
		var innerWidth = window.innerWidth;

		if( !innerWidth ){ return false;}

		document.documentElement.style.fontSize = ( innerWidth*20/320 ) + 'px';

	};

	hotcss.mresize(); 
	//直接调用一次

	window.addEventListener( 'resize' , hotcss.mresize , false ); 
	//绑定resize的时候调用

	window.addEventListener( 'load' , hotcss.mresize , false ); 
	//防止不明原因的bug。load之后再调用一次。


	setTimeout(function(){
		hotcss.mresize(); 
		//防止某些机型怪异现象，异步再调用一次
	},0)

	window.hotcss = hotcss; 
	//命名空间暴露给你，控制权交给你，想怎么调怎么调。


})( window , document );