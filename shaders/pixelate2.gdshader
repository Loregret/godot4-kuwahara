// https://www.shadertoy.com/view/Ms3SRN
shader_type canvas_item;


uniform float pixel_size = 200.;
uniform float color_amount = 6.;



void fragment() {
	vec2 uv = UV;
	vec2 newRes = vec2(pixel_size, pixel_size);
	vec3 pal = vec3(color_amount);
	
	float aspectRatio = (1.0/TEXTURE_PIXEL_SIZE).x / (1.0/TEXTURE_PIXEL_SIZE).y;
	
	newRes.x *= aspectRatio;
	
	uv = floor( uv * newRes ) / newRes; //the actual magic. 
	vec4 color = texture( TEXTURE, uv ); 
	
	color.xyz = floor( color.xyz * pal  ) / pal.xyz;
	
	 COLOR = color;
}