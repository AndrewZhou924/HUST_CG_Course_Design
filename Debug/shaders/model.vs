// #version 330 core
// layout (location = 0) in vec3 aPos;
// layout (location = 1) in vec3 aNormal;
// layout (location = 2) in vec2 aTexCoords;

// out vec2 TexCoords;
// out vec3 FragPos;
// out vec3 Normal;

// uniform mat4 model;
// uniform mat4 view;
// uniform mat4 projection;
// uniform mat4 newview;

// // out vec2 TexCoords;

// out VS_OUT {
//     vec3 FragPos;
//     vec3 Normal;
//     vec2 TexCoords;
//     vec4 FragPosLightSpace;
// } vs_out;

// uniform mat4 lightSpaceMatrix;

// void main()
// {
//     TexCoords = aTexCoords;    
//     // gl_Position = projection * view * model * vec4(aPos, 1.0);

//     FragPos = vec3(model * vec4(aPos, 1.0));
//     Normal = aNormal;  

//     // gl_Position = projection * newview * vec4(FragPos, 1.0);
//     // gl_Position = projection * newview * model * newview * vec4(aPos, 1.0);

    
//     //  gl_Position = projection * view * vec4(FragPos, 1.0);

//     vs_out.FragPos = vec3(model * vec4(aPos, 1.0));
//     vs_out.Normal = transpose(inverse(mat3(model))) * aNormal;
//     vs_out.TexCoords = aTexCoords;
//     vs_out.FragPosLightSpace = lightSpaceMatrix * vec4(vs_out.FragPos, 1.0);
//     gl_Position = projection * view * model * vec4(aPos, 1.0);
// }


//普通的光照模型
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

void main()
{
    TexCoords = aTexCoords;    
    // gl_Position = projection * view * model * vec4(aPos, 1.0);

    FragPos = vec3(model * vec4(aPos, 1.0));
    Normal = aNormal;  
    
    gl_Position = projection * view * vec4(FragPos, 1.0);
}


// #version 330 core
// layout (location = 0) in vec3 aPos;
// layout (location = 1) in vec3 aNormal;
// layout (location = 2) in vec2 aTexCoords;

// out vec2 TexCoords;

// uniform mat4 model;
// uniform mat4 view;
// uniform mat4 projection;

// void main()
// {
//     TexCoords = aTexCoords;    
//     gl_Position = projection * view * model * vec4(aPos, 1.0);
// }




// YK
// #version 330 core
// layout (location = 0) in vec3 aPos;
// layout (location = 1) in vec3 aNormal;
// layout (location = 2) in vec2 aTexCoords;

// out vec2 TexCoords;
// out vec3 FragPos;
// out vec3 Normal;

// uniform mat4 model;
// uniform mat4 view;
// uniform mat4 projection;
// uniform mat4 newview;

// void main()
// {
//     TexCoords = aTexCoords;    
//     // gl_Position = projection * view * model * vec4(aPos, 1.0);

//     FragPos = vec3(model * vec4(aPos, 1.0));
//     Normal = aNormal;  

//     // gl_Position = projection * newview * vec4(FragPos, 1.0);
//     // gl_Position = projection * view * model *newview * vec4(aPos, 1.0);

//     gl_Position = projection * view * model *newview * vec4(aPos, 1.0);
    
//     //  gl_Position = projection * view * vec4(FragPos, 1.0);
// }