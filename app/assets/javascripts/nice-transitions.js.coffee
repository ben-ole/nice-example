# Transition Animaation Configuration

class this.NiceTransitions
	@default = 
		duration: 1000
		easing: "linear"
		properties:
			opacity: 0.0
	
	@fade_slow = 
		duration: 2000
		easing: "linear"			
		properties:
			opacity: 0.0
			
	@slide_top =
		duration: 1000
		easing: "swing"			
		properties:
			"top": "-200px"