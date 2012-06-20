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
		duration: 3000
		easing: "linear"			
		properties:
			"top": "-200px"