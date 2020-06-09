(function (){
	var sess = window.sessionStorage;
	for (key in sess) {
		console.log(key)
		console.log(sessionStorage.getItem(key))
	}
})();