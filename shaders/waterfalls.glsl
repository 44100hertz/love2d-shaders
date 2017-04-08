extern float offset;

const int screenwid = 506;
const int numcols = 3;

const vec4 key_left = vec4( 58/255.0, 123/255.0, 145/255.0, 1);
const vec4 key_right = vec4( 80/255.0, 185/255.0, 179/255.0, 1);

const vec4 col[numcols] = vec4[numcols](
     vec4(  58/255.0, 123/255.0, 145/255.0, 1),
     vec4(  80/255.0, 185/255.0, 179/255.0, 1),
     vec4( 183/255.0, 233/255.0, 225/255.0, 1));
    // vec4(1,0,0,1),
    // vec4(1,1,0,1),
    // vec4(0,1,0,1),
    // vec4(0,1,1,1),
    // vec4(0,0,1,1),
    // vec4(1,0,1,1));

vec4 effect( vec4 color, Image texture, vec2 tc, vec2 screen_coords )
{
    vec4 rgba = Texel(texture, tc);

    bool is_left = rgba==key_left;
    bool is_right = rgba==key_right;
    if (!(is_left || is_right)) return rgba;

    float off_x = is_left ? tc.x * 20 : -tc.x * 20;
    float total = offset - tc.y * 40 - off_x + sin(tc.y*100 + tc.x*200) * 0.1;

    if (mod(total, 1) < 0.5 && mod((tc.y+tc.x+0.25) * screenwid, 2) < 1) total -= 1;

    int mod1 = int(mod(total, numcols));

    return col[mod1];
}
