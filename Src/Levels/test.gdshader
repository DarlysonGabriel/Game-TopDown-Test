shader_type canvas_item;

uniform float speed = 1.5;
// uniform float wave_size = 16.0;
uniform float strength = 0.02;
uniform float pixel_size = 32.0;

void fragment() {
    vec2 uv = UV;

    // Movimento da onda
    float wave = sin(
        floor(uv.y * pixel_size) +
        TIME * speed
    );

    // Distorção em passos
    uv.x += wave * strength;

    COLOR = texture(TEXTURE, uv);
}
  