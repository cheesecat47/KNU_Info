(function () {
	/* references
	 * https://www.youtube.com/watch?v=pLaON5_bysU 
	 */
	var init,
		windowWidth = 0, // width of the browser
		windowHeight = 0, // height of the browser
		resizeHandler,
		totalScrollHeight = 0, // scrollable height
		pixelDuration = 0, // height of each keyframe
		keyframes = [
			{
				animationValues: {
					image1: [0, 0],
					image3: [0, 0],
					bottom_text: [0, 0],
					img1_opacity: [1, 0],
					img3_opacity: [0, 1],
					txt_opacity: [0, 0],
					img1_scale: [1, 0.7],
					img3_scale: [0.7, 1],
				}
			},
			{
				animationValues: {
					image1: [0, 0],
					image3: [0, 0],
					bottom_text: [0, 0],
					img1_opacity: [0, 0],
					img3_opacity: [1, 0],
					txt_opacity: [0, 1],
					img1_scale: [0.7, 0.7],
					img3_scale: [1, 0.7],
				}
			},
			{
				animationValues: {
					image1: [0, 0],
					image3: [0, 0],
					bottom_text: [0, 0],
					img1_opacity: [0, 0],
					img3_opacity: [0, 0],
					txt_opacity: [1, 0],
					img1_scale: [0.7,0.7],
					img3_scale: [0.7,0.7],
				}
			}
		],
		render,
		currentKeyFrame = 0, // current keyframe
		calcAnimationValue,
		relativeScrollY = 0, // reletive scroll position using in each keyframe
		scrollHandler,
		scrollY = 0,	// current scroll position
		prevDurations = 0, // duration from prev keyframe
		
		
	
	init = function () {
		console.log("init");
		windowWidth = window.innereWidth;
		windowHeight = window.innerHeight;
		console.log('width '+windowWidth+' height '+windowHeight);
		
		resizeHandler(); // handler
		render();
		
		window.addEventListener('resize', function () {
			requestAnimationFrame(resizeHandler); // call when the browser is ready to render.
		});
		
		window.addEventListener('scroll', function () {
			requestAnimationFrame(scrollHandler);
		});
	};
	
	resizeHandler = function () {
		console.log("resizeHandler");
		var i;
		windowWidth = window.innerWidth;
		windowHeight = window.innerHeight;
		console.log('width '+windowWidth+' height '+windowHeight);
		
		totalScrollHeight = 0;
		pixelDuration = 0.5 * windowHeight; // duration of each keyframe
		console.log('pixelDuration '+pixelDuration);
		
		for (i=0; i<keyframes.length; i++){
			totalScrollHeight += pixelDuration;
			
			thisframe = keyframes[i];
			console.log(thisframe);
			keyframes[i].animationValues.image1[0] = windowHeight * (-i);
			keyframes[i].animationValues.image1[1] = windowHeight * (-1 - i);
			keyframes[i].animationValues.image3[0] = windowHeight * (1 - i);
			keyframes[i].animationValues.image3[1] = windowHeight * (-i);
			keyframes[i].animationValues.bottom_text[0] = windowHeight * (2 - i);
			keyframes[i].animationValues.bottom_text[1] = windowHeight * (1 - i);
		}
		totalScrollHeight += 2 * pixelDuration;
		
		
		document.body.style.height = totalScrollHeight + 'px';
		console.log("body height "+document.body.style.height);
	};
	
	render = function () {
		console.log("render: currentKeyFrame: "+currentKeyFrame);
		var image1;
		
		if (keyframes[currentKeyFrame]) {
			image1 = calcAnimationValue(keyframes[currentKeyFrame].animationValues.image1);
			image3 = calcAnimationValue(keyframes[currentKeyFrame].animationValues.image3);
			bottom_text = calcAnimationValue(keyframes[currentKeyFrame].animationValues.bottom_text);
			img1_opacity = calcAnimationValue(keyframes[currentKeyFrame].animationValues.img1_opacity);
			img3_opacity = calcAnimationValue(keyframes[currentKeyFrame].animationValues.img3_opacity);
			txt_opacity = calcAnimationValue(keyframes[currentKeyFrame].animationValues.txt_opacity);
			img1_scale = calcAnimationValue(keyframes[currentKeyFrame].animationValues.img1_scale);
			img3_scale = calcAnimationValue(keyframes[currentKeyFrame].animationValues.img3_scale);
		} else {
			return;
		}
		
		document.getElementById('img1').style.transform = 'translate3d(0px, ' + image1 + 'px, 0px) scale('+img1_scale+')';
		document.getElementById('img3').style.transform = 'translate3d(0px, ' + image3 + 'px, 0px) scale('+img3_scale+')';
		document.getElementById('bottom_text').style.transform = 'translate3d(0px, ' + bottom_text + 'px, 0px)';
		document.getElementById('img1').style.opacity = img1_opacity;
		document.getElementById('img3').style.opacity = img3_opacity;
		document.getElementById('bottom_text').style.opacity = txt_opacity;
	};
	
	calcAnimationValue = function (values) {
		//console.log("calcAnimationValue");
		return (relativeScrollY / pixelDuration) * (values[1] - values[0]) + values[0];
	}
	
	scrollHandler = function () {
		console.log("scrollHandler");
		scrollY = window.pageYOffset; // current scroll position
		console.log('scrollY '+scrollY);
		
		if (scrollY < 0 || scrollY > (totalScrollHeight - pixelDuration)) {
			console.log("scrollHandler: restrict scroll range");
			return; // restrict scroll range
		}
		
		if (scrollY >= 0 && scrollY < pixelDuration) {
			currentKeyFrame = 0;
			relativeScrollY = scrollY;
		} else if (scrollY >= pixelDuration && scrollY < 2*pixelDuration) {
			currentKeyFrame = 1;
			relativeScrollY = scrollY - pixelDuration;
		} else {
			currentKeyFrame = 2;
			relativeScrollY = scrollY - 2*pixelDuration;
		}
		console.log('currentKeyframe', currentKeyFrame);
		console.log('relativeScrollY', relativeScrollY);
		
		render();
	}
	
	init();
})();
