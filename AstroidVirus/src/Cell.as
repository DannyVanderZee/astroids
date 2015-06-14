package  
{
	import flash.display.Sprite;
	
	public class Cell extends Sprite
	{
		
		// onze belangrijkste Vectors: velocity (beweging) en positie
		private var _velocity	:	Vector2D	=	new Vector2D(0, 0);
		private var _position	:	Vector2D	=	new Vector2D(-100, -100);
		
		private var _maxSpeed		:	Number	=	1;
		private var _mass			:	Number	=	1;
		private var _slowingRadius	:	Number	=	100;
		
		private var _target : Vector2D; // wat is onze target op dit moment?
		
		public function Cell() 
		{
		}
		
		public function update():void
		{
			
			// eerst zoeken we onze target op en proberen we te sturen
			seek();
			
			// beweeg het object door middel van de Euler formule positie = positie + velocity
			_position = _position.add(_velocity);
			
			// we moeten de positie nog doorvertalen naar de 'visuele' positie van deze sprite
			x = _position.x;
			y = _position.y;
			
			
		}
		
		public function seek() : void
		{
			// als we geen target hebben, stop deze functie
			if (!_target)
			{
				return; // door 'return' stopt deze functie
			}
			
			var currentTarget : Vector2D = _target.cloneVector();
			
			// we berekenen eerst de afstand/Vector tot de 'target' (in dit voorbeeld de muis)
			var desiredStep:Vector2D	=	currentTarget.subtract(_position);
			var distanceToTarget		=	desiredStep.length;
			
			// deze desiredStep mag niet groter zijn dan de maximale Speed
			//
			// als een vector ge'normalized' is .. dan houdt hij dezelfde richting
			// maar zijn lengte/magnitude is 1
			desiredStep.normalize();
		
			// als je deze weer vermenigvuldigt met de maximale snelheid dan
			// wordt de lengte van deze Vector maxSpeed (aangezien 1 x maxSpeed = maxSpeed)
			// de x en y van deze Vector wordt zo vanzelf omgerekend
			var desiredVelocity:Vector2D			=	desiredStep.multiply(maxSpeed);
			
			// bereken wat de Vector moet zijn om bij te sturen om bij de desiredVelocity te komen
			var steeringForce:Vector2D = desiredVelocity.subtract(_velocity);
			
			// uiteindelijk voegen we de steering force toe maar wel gedeeld door de 'mass'
			// hierdoor gaat hij niet in een rechte lijn naar de target
			// hoe zwaarder het object hoe moeilijker hij kan bijsturen
			steeringForce.divide(_mass);
			
			_velocity.add(steeringForce);
			
			// rotation = the velocity's angle converted to degrees
			rotation = _velocity.angle * 180 / Math.PI;
		}
		
		public function setTarget(target:Vector2D):void 
		{
			_target = target;
		}
		
		public function get maxSpeed():Number 
		{
			return _maxSpeed;
		}
		
		public function set maxSpeed(value:Number):void 
		{
			_maxSpeed = value;
		}
		
		public function get mass():Number 
		{
			return _mass;
		}
		
		public function set mass(value:Number):void 
		{
			_mass = value;
		}
		
		public function get slowingRadius():Number 
		{
			return _slowingRadius;
		}
		
		public function set slowingRadius(value:Number):void 
		{
			_slowingRadius = value;
		}
	}

}