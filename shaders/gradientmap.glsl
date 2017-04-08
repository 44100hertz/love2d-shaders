extern float offset;

const int numcols = 5;
const vec4 col[numcols] = vec4[numcols](
     vec4(   0/255.0,   0/255.0,   0/255.0, 1),
     vec4( 129/255.0,  29/255.0,  30/255.0, 1),
     vec4( 253/255.0, 107/255.0,  91/255.0, 1),
     vec4(  99/255.0, 191/255.0,  96/255.0, 1),
     vec4( 222/255.0, 214/255.0, 162/255.0, 1));
    // vec4(1,0,0,1),
    // vec4(1,1,0,1),
    // vec4(0,1,0,1),
    // vec4(0,1,1,1),
    // vec4(0,0,1,1),
    // vec4(1,0,1,1));

vec4 effect( vec4 color, Image texture, vec2 tc, vec2 screen_coords )
{
    vec4 rgba = Texel(texture, tc) * (numcols-1);
    float key = rgba.r * 0.2126 + rgba.g * 0.7152 + rgba.b * 0.0722;
    float total = key + offset;
    int mod1 = int(mod(total, numcols));
    int mod2 = int(mod(total + 1, numcols));
    float lerp = mod(key + offset, 1);
    return
        col[mod1] * (1-lerp) +
        col[mod2] * (lerp);
}
