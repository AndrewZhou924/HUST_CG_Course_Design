#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 FragPos;
out vec3 Normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform mat4 newview;

void main()
{
    TexCoords = aTexCoords;    


    // view[0][0] = 1;
    // view[0][1] = 1;
    // view[0][2] = 1;
    // view[1][0] = 1;
    // view[1][1] = 1;
    // view[1][2] = 1;

    mat4 newview2 = view;
    float a;
    a = newview2[0][1];
    newview2[0][1] = newview2[1][0];
    newview2[1][0] = a;

    a = newview2[0][2];
    newview2[0][2] = newview2[2][0];
    newview2[2][0] = a;

    a = newview2[1][2];
    newview2[1][2] = newview2[2][1];
    newview2[2][1] = a;

    newview2[0][3] = 0.0f;
    newview2[1][3] = 0.0f;
	newview2[2][3] = 0.0f;
    newview2[3][3] = 1.0f;
	newview2[3][0] = 0.0f;
	newview2[3][1] = 0.0f;
    newview2[3][2] = 0.0f;

    // newview2[0][0] = 1;
    // newview2[0][1] = 1;
    // newview2[0][2] = 1;
    // newview2[1][0] = 1;
    // newview2[1][1] = 1;
    // newview2[1][2] = 1;

    // view[0][0] = 1;
    // view[0][1] = 1;
    // view[0][2] = 1;
    // view[1][0] = 1;
    // view[1][1] = 1;
    // view[1][2] = 1;


    // gl_Position = projection * view * model * vec4(aPos, 1.0);

    FragPos = vec3(model * vec4(aPos, 1.0));
    Normal = aNormal;  

    // gl_Position = projection * newview * vec4(FragPos, 1.0);
    // gl_Position = projection * view * model *newview * vec4(aPos, 1.0);

    gl_Position = projection * view * model * newview2 * vec4(aPos, 1.0);
    // gl_Position[2][0] = 0;
    // gl_Position[2][1] = 0;
    // gl_Position[0][2] = 0;
    // gl_Position[1][2] = 0;
    // gl_Position[2][2] = 1;
    
    //  gl_Position = projection * view * vec4(FragPos, 1.0);
}