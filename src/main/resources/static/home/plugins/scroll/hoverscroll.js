function HoverScroller(elmt, direction, list) {
	let self = this;
	
	self.elmt = $(elmt);
	self.direction = direction;
	self.list = $(list);
	self.visible = ! (self.elmt.css("display") == "none" || self.elmt.css("visibility") == "hidden");
	
	
	
	self.animate = {};
	
	self.animate.in = function() {
		self.elmt.fadeIn(250);
	};
	self.animate.out = function() {
		self.elmt.fadeOut(100)
	};
	
	
	
	self.check = function(initial = false) {
		const scrollableWidth = self.list.prop("scrollWidth") - self.list.width();
		if (scrollableWidth == 0) { // if list can't actually be scrolled
			self.elmt.hide();
			self.visible = false;
			return;
		}
		let atLimit; // bool (equals true when scrolled to limit)
		switch (self.direction) { // switch the limit/wall depending on scroll direction
			case "left":
				atLimit = self.list.scrollLeft() == 0;
				break;
			case "right":
				atLimit = self.list.scrollLeft() == scrollableWidth;
				break;
		}
		if (initial) { // if list is being loaded for the first time
			if (atLimit) {
				if (self.visible) {
					//self.animate.out(self.elmt);
					self.elmt.hide();
					self.visible = false;
				}
				
			} else {
				self.elmt.show();
				self.visible = true;
			}
			return;
		} 
		if (atLimit) { // if list is scrolled to left
			if (self.visible) {
				self.animate.out(self.elmt);
				self.visible = false;
			}
		} else if (! self.visible) {
			self.animate.in(self.elmt);
			self.visible = true;
		}
	};
	self.check(true); // execute on initialisation
	
	
	
	self.scroll = {};
	
	self.scroll.start = function(pps=1000, easing="linear") { // pps = pixels per second
		let target, dist;
		switch (self.direction) {
			case "left":
				target = 0; // start of list
				dist = self.list.scrollLeft(); // distance from start
				break;
			case "right":
				target = self.list.prop("scrollWidth") - self.list.width(); // end of list
				dist = target - self.list.scrollLeft(); // distance from end
				break;
		}
		const dur = (dist / pps) * 1000; // calculated anim duration in seconds
		self.list.animate({
			scrollLeft: target
		}, dur, easing, function() {
			self.list.stop(); // stop() probably isnt necessary here, but just in case
		});
	};
	self.scroll.stop = function() {
		self.list.stop();
	};
}
