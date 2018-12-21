// #version 330 core
// out vec4 FragColor;
// in vec2 TexCoords;

// in vec3 Normal;  
// in vec3 FragPos;  
// uniform vec3 lightPos; 
// uniform vec3 lightColor;
// uniform vec3 objectColor;

// uniform sampler2D texture_diffuse1;

// void main()
// {    
//     // vec4 FragColor1 = texture(texture_diffuse1, TexCoords);
//     // ambient
//     float ambientStrength = 0.1;
//     vec3 ambient = ambientStrength * lightColor;
  	
//     // diffuse 
//     vec3 norm = normalize(Normal);
//     vec3 lightDir = normalize(lightPos - FragPos);
//     float diff = max(dot(norm, lightDir), 0.0);
//     vec3 diffuse = diff * lightColor;
            
//     // vec3 result = (ambient + diffuse) * objectColor;
//     // vec3 result = (ambient + diffuse) * texture(texture_diffuse1, TexCoords);

//     vec3 FragColor1 = vec3(texture(texture_diffuse1, TexCoords));
//     vec3 result = (ambient + diffuse) * FragColor1;


//     // vec3 result = (ambient + diffuse) * FragColor1;
//     FragColor = vec4(result, 1.0);

//     // FragColor = texture(texture_diffuse1, TexCoords);
// }

#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;
in vec2 TexCoords;

struct Material {
    vec3 specular;
    float shininess;
}; 
struct Light {
    vec3 position;

    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
};
uniform Light light;

uniform Material material;
  
uniform vec3 objectColor;
uniform vec3 lightPos;
uniform vec3 viewPos;

uniform sampler2D texture_diffuse1;

void main()
{   
    vec3 ambient = light.ambient * vec3(texture(texture_diffuse1, TexCoords)); 
    //漫反射
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = light.diffuse * diff * vec3(texture(texture_diffuse1, TexCoords));
    //镜面反射
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);  
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
    vec3 specular = light.specular * (spec * material.specular);  

    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, 1.0);
}