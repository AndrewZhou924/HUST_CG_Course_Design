#version 330 core
out vec4 FragColor;
in vec2 TexCoords;

in vec3 Normal;  
in vec3 FragPos;  
uniform vec3 lightPos; 
uniform vec3 lightColor;
uniform vec3 objectColor;

uniform sampler2D texture_diffuse1;

void main()
{    
    // vec4 FragColor1 = texture(texture_diffuse1, TexCoords);
    // ambient
    float ambientStrength = 0.3;
    vec3 ambient = ambientStrength * lightColor;
  	
    // diffuse 
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;
            
    // vec3 result = (ambient + diffuse) * objectColor;
    // vec3 result = (ambient + diffuse) * texture(texture_diffuse1, TexCoords);

    vec3 FragColor1 = vec3(texture(texture_diffuse1, TexCoords));
    vec3 result = (ambient + diffuse) * FragColor1;
    //vec3 result = (diffuse ) * FragColor1;


    // vec3 result = (ambient + diffuse) * FragColor1;
    FragColor = vec4(result, 1.0);

    // FragColor = texture(texture_diffuse1, TexCoords);
}


// #version 330 core
// out vec4 FragColor;

// in vec2 TexCoords;

// uniform sampler2D texture_diffuse1;

// void main()
// {    
//     FragColor = texture(texture_diffuse1, TexCoords);
// }