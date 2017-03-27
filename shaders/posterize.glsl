// ripped from https://love2d.org/wiki/love.graphics.newShader

uniform int levels = 8;

#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 texcolor = Texel(texture, texture_coords);
    return ceil(texcolor * color * levels) / levels;
}
#endif

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    return transform_projection * vertex_position;
}
#endif
